import { useEffect, useMemo, useState } from 'react';
import { Nav, Notice } from './components/AppChrome';
import { ItemModal } from './components/WorkoutBuilder';
import BuilderScreen from './screens/BuilderScreen';
import HomeScreen from './screens/HomeScreen';
import MyWorkoutsScreen from './screens/MyWorkoutsScreen';
import api from './services/api';
import { getCategoryId } from './utils/exercise';

const CURRENT_USER_ID = 1;
const EMPTY_ITEM = { series: 3, repeticoes: 12, peso: 0 };

export default function App() {
  const [screen, setScreen] = useState('home');
  const [categories, setCategories] = useState([]);
  const [exercises, setExercises] = useState([]);
  const [availableExercises, setAvailableExercises] = useState(0);
  const [savedWorkouts, setSavedWorkouts] = useState([]);
  const [selectedCategory, setSelectedCategory] = useState('all');
  const [workout, setWorkout] = useState({ nomeTreino: 'Treino A' });
  const [items, setItems] = useState([]);
  const [modalState, setModalState] = useState(null);
  const [itemForm, setItemForm] = useState(EMPTY_ITEM);
  const [isLoading, setIsLoading] = useState(false);
  const [isLoadingWorkouts, setIsLoadingWorkouts] = useState(false);
  const [isSaving, setIsSaving] = useState(false);
  const [notice, setNotice] = useState(null);

  const showNotice = (type, text) => {
    setNotice({ type, text });
    window.setTimeout(() => setNotice(null), 4500);
  };

  useEffect(() => {
    api.get('/exercicios').then(({ data }) => setAvailableExercises(Array.isArray(data) ? data.length : 0)).catch(() => setAvailableExercises(0));
  }, []);

  useEffect(() => {
    if (screen !== 'my-workouts') return;
    const loadWorkouts = async () => {
      setIsLoadingWorkouts(true);
      try {
        const { data } = await api.get('/fichas-treino');
        setSavedWorkouts(Array.isArray(data) ? data : []);
      } catch (error) {
        console.error('Erro ao carregar treinos:', error);
        showNotice('error', 'Não foi possível carregar os seus treinos.');
      } finally { setIsLoadingWorkouts(false); }
    };
    void loadWorkouts();
  }, [screen]);

  useEffect(() => {
    if (screen !== 'builder' || exercises.length) return;
    const loadBuilderData = async () => {
      setIsLoading(true);
      const [categoryResult, exerciseResult] = await Promise.allSettled([api.get('/categorias'), api.get('/exercicios')]);
      if (categoryResult.status === 'fulfilled' && Array.isArray(categoryResult.value.data)) setCategories(categoryResult.value.data);
      if (exerciseResult.status === 'fulfilled' && Array.isArray(exerciseResult.value.data)) setExercises(exerciseResult.value.data);
      if (exerciseResult.status === 'rejected') showNotice('error', 'Não foi possível carregar o catálogo de exercícios.');
      setIsLoading(false);
    };
    void loadBuilderData();
  }, [screen, exercises.length]);

  const filteredExercises = useMemo(() => selectedCategory === 'all' ? exercises : exercises.filter((exercise) => String(getCategoryId(exercise)) === String(selectedCategory)), [exercises, selectedCategory]);
  const openItemModal = (exercise) => { setModalState({ exercise, itemId: null }); setItemForm({ ...EMPTY_ITEM }); };
  const editItem = (item) => { setModalState({ exercise: item.exercicio, itemId: item.id }); setItemForm({ series: item.series, repeticoes: item.repeticoes, peso: item.peso }); };
  const saveItem = (event) => {
    event.preventDefault();
    if (!modalState) return;
    const nextItem = { exercicio: modalState.exercise, series: Number(itemForm.series), repeticoes: Number(itemForm.repeticoes), peso: Number(itemForm.peso) };
    setItems((current) => modalState.itemId ? current.map((item) => item.id === modalState.itemId ? { ...item, ...nextItem } : item) : [...current, { id: `${modalState.exercise.id}-${Date.now()}`, ...nextItem }]);
    setModalState(null);
  };
  const saveWorkout = async () => {
    if (!workout.nomeTreino.trim() || !items.length) return showNotice('error', 'Preencha o nome do treino e adicione ao menos um exercício.');
    const payload = { nomeTreino: workout.nomeTreino.trim(), usuarioId: CURRENT_USER_ID, itens: items.map((item) => ({ exercicioId: item.exercicio.id, series: item.series, repeticoes: item.repeticoes, peso: item.peso })) };
    try {
      setIsSaving(true);
      await api.post('/fichas-treino', payload);
      setItems([]); setWorkout({ nomeTreino: 'Treino A' }); setScreen('my-workouts');
      showNotice('success', 'Treino salvo com sucesso!');
    } catch (error) {
      console.error('Erro ao salvar treino:', error);
      showNotice('error', 'Não foi possível salvar o treino. Verifique a conexão com a API.');
    } finally { setIsSaving(false); }
  };

  return <main className="min-h-screen bg-gradient-to-br from-zinc-900 via-zinc-950 to-zinc-950 text-zinc-100 selection:bg-orange-500/40"><div aria-hidden="true" className="fixed inset-0 overflow-hidden pointer-events-none"><div className="absolute -top-40 right-0 h-96 w-96 rounded-full bg-orange-500/10 blur-3xl" /><div className="absolute bottom-0 -left-32 h-80 w-80 rounded-full bg-rose-500/5 blur-3xl" /></div><div className="relative z-10">{notice && <Notice notice={notice} />}<Nav screen={screen} onNavigate={setScreen} />{screen === 'home' && <HomeScreen onCreate={() => setScreen('builder')} availableExercises={availableExercises} />}{screen === 'builder' && <BuilderScreen categories={categories} exercises={filteredExercises} selectedCategory={selectedCategory} setSelectedCategory={setSelectedCategory} workout={workout} setWorkout={setWorkout} items={items} isLoading={isLoading} isSaving={isSaving} onAdd={openItemModal} onEdit={editItem} onRemove={(id) => setItems((current) => current.filter((item) => item.id !== id))} onSave={saveWorkout} />}{screen === 'my-workouts' && <MyWorkoutsScreen workouts={savedWorkouts} isLoading={isLoadingWorkouts} onCreate={() => setScreen('builder')} />}{modalState && <ItemModal exercise={modalState.exercise} isEditing={Boolean(modalState.itemId)} form={itemForm} setForm={setItemForm} onClose={() => setModalState(null)} onSubmit={saveItem} />}</div></main>;
}
