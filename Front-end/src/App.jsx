import { useEffect, useMemo, useState } from 'react';
import {
  BarChart3, CheckCircle2, ChevronDown, ChevronRight, ClipboardList,
  Dumbbell, LoaderCircle, Pencil, Plus, Trash2, X,
} from 'lucide-react';
import api from './services/api';

const CURRENT_USER_ID = 1;
const EMPTY_ITEM = { series: 3, repeticoes: 12, peso: 0 };

const CATEGORY_IMAGES = {
  pernas: 'https://images.unsplash.com/photo-1574680096145-d05b474e2155?auto=format&fit=crop&w=900&q=80',
  peito: 'https://images.unsplash.com/photo-1581009146145-b5ef050c2e1e?auto=format&fit=crop&w=900&q=80',
  costas: 'https://images.unsplash.com/photo-1534438327276-14e5300c3a48?auto=format&fit=crop&w=900&q=80',
  ombros: 'https://images.unsplash.com/photo-1583454110551-21f2fa2afe61?auto=format&fit=crop&w=900&q=80',
  biceps: 'https://images.unsplash.com/photo-1583454110551-21f2fa2afe61?auto=format&fit=crop&w=900&q=80',
  triceps: 'https://images.unsplash.com/photo-1583454110551-21f2fa2afe61?auto=format&fit=crop&w=900&q=80',
  abdomen: 'https://images.unsplash.com/photo-1579758629938-03607ccdbaba?auto=format&fit=crop&w=900&q=80',
  gluteos: 'https://images.unsplash.com/photo-1574680096145-b05b474e2155?auto=format&fit=crop&w=900&q=80',
};

const getCategoryId = (exercise) => exercise.categoria?.id ?? exercise.categoriaId ?? exercise.idCategoria;
const normalizeCategoryName = (name = '') => name.normalize('NFD').replace(/[\u0300-\u036f]/g, '').toLowerCase();
const getCategoryName = (exercise, categories = []) => exercise.categoria?.nome
  ?? categories.find((category) => String(category.id) === String(getCategoryId(exercise)))?.nome
  ?? 'Exercício';
const getImageUrl = (exercise, categories = []) => {
  const imageUrl = (exercise.urlImagem ?? exercise.imagemUrl ?? exercise.imagem ?? exercise.foto)?.trim();
  if (imageUrl && !imageUrl.toLowerCase().includes('exemplo.com')) return imageUrl;
  const categoryName = getCategoryName(exercise, categories);
  return CATEGORY_IMAGES[normalizeCategoryName(categoryName)] || 'https://images.unsplash.com/photo-1517836357463-d25dfeac3438?auto=format&fit=crop&w=900&q=80';
};
const getRoutineItems = (routine) => routine.itens ?? routine.itensTreino ?? routine.exercicios ?? [];
const getItemExercise = (item) => item.exercicio ?? item.exercise ?? { id: item.exercicioId, nome: item.nomeExercicio ?? 'Exercício' };
const getRoutineName = (routine) => routine.nomeTreino ?? routine.nome ?? 'Treino sem nome';

function App() {
  const [screen, setScreen] = useState('home');
  const [categories, setCategories] = useState([]);
  const [exercises, setExercises] = useState([]);
  const [availableExercises, setAvailableExercises] = useState(0);
  const [savedRoutines, setSavedRoutines] = useState([]);
  const [selectedCategory, setSelectedCategory] = useState('all');
  const [routine, setRoutine] = useState({ nomeTreino: 'Treino A' });
  const [items, setItems] = useState([]);
  const [modalState, setModalState] = useState(null);
  const [itemForm, setItemForm] = useState(EMPTY_ITEM);
  const [isLoading, setIsLoading] = useState(false);
  const [isLoadingRoutines, setIsLoadingRoutines] = useState(false);
  const [isSaving, setIsSaving] = useState(false);
  const [notice, setNotice] = useState(null);

  const showNotice = (type, text) => {
    setNotice({ type, text });
    window.setTimeout(() => setNotice(null), 4500);
  };

  const loadSavedRoutines = async () => {
    setIsLoadingRoutines(true);
    try {
      const { data } = await api.get('/fichas-treino');
      setSavedRoutines(Array.isArray(data) ? data : []);
    } catch (error) {
      console.error('Erro ao carregar fichas de treino:', error);
      showNotice('error', 'Não foi possível carregar os seus treinos.');
    } finally {
      setIsLoadingRoutines(false);
    }
  };

  useEffect(() => {
    api.get('/exercicios')
      .then(({ data }) => setAvailableExercises(Array.isArray(data) ? data.length : 0))
      .catch(() => setAvailableExercises(0));
  }, []);

  useEffect(() => {
    if (screen !== 'my-workouts') return undefined;
    const timer = window.setTimeout(() => { void loadSavedRoutines(); }, 0);
    return () => window.clearTimeout(timer);
    // loadSavedRoutines intentionally runs only when the user opens this view.
    // eslint-disable-next-line react-hooks/exhaustive-deps
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
    loadBuilderData();
  }, [screen, exercises.length]);

  const filteredExercises = useMemo(() => selectedCategory === 'all' ? exercises : exercises.filter((exercise) => String(getCategoryId(exercise)) === String(selectedCategory)), [exercises, selectedCategory]);
  const openItemModal = (exercise) => { setModalState({ exercise, itemId: null }); setItemForm({ ...EMPTY_ITEM }); };
  const editItem = (item) => { setModalState({ exercise: item.exercicio, itemId: item.id }); setItemForm({ series: item.series, repeticoes: item.repeticoes, peso: item.peso }); };
  const saveItem = (event) => {
    event.preventDefault();
    if (!modalState) return;
    const nextItem = { exercicio: modalState.exercise, series: Number(itemForm.series), repeticoes: Number(itemForm.repeticoes), peso: Number(itemForm.peso) };
    setItems((current) => modalState.itemId
      ? current.map((item) => item.id === modalState.itemId ? { ...item, ...nextItem } : item)
      : [...current, { id: `${modalState.exercise.id}-${Date.now()}`, ...nextItem }]);
    setModalState(null);
  };
  const saveRoutine = async () => {
    if (!routine.nomeTreino.trim() || !items.length) return showNotice('error', 'Preencha o nome do treino e adicione ao menos um exercício.');
    const payload = { nomeTreino: routine.nomeTreino.trim(), usuarioId: CURRENT_USER_ID, itens: items.map((item) => ({ exercicioId: item.exercicio.id, series: item.series, repeticoes: item.repeticoes, peso: item.peso })) };
    try {
      setIsSaving(true);
      await api.post('/fichas-treino', payload);
      setItems([]); setRoutine({ nomeTreino: 'Treino A' }); setScreen('my-workouts');
      showNotice('success', 'Rotina salva com sucesso!');
    } catch (error) {
      console.error('Erro ao salvar ficha de treino:', error);
      showNotice('error', 'Não foi possível salvar a rotina. Verifique a conexão com a API.');
    } finally { setIsSaving(false); }
  };

  return <main className="min-h-screen bg-gradient-to-br from-zinc-900 via-zinc-950 to-zinc-950 text-zinc-100 selection:bg-indigo-500/40">
    <div aria-hidden="true" className="fixed inset-0 overflow-hidden" style={{ pointerEvents: 'none' }}><div className="absolute -top-40 right-0 h-96 w-96 rounded-full bg-indigo-500/10 blur-3xl" /><div className="absolute bottom-0 -left-32 h-80 w-80 rounded-full bg-violet-500/5 blur-3xl" /></div>
    <div className="relative z-10">
      {notice && <Notice notice={notice} />}
      <Nav screen={screen} onNavigate={setScreen} />
      {screen === 'home' && <HomeScreen onCreate={() => setScreen('builder')} availableExercises={availableExercises} />}
      {screen === 'builder' && <BuilderScreen categories={categories} exercises={filteredExercises} selectedCategory={selectedCategory} setSelectedCategory={setSelectedCategory} routine={routine} setRoutine={setRoutine} items={items} isLoading={isLoading} isSaving={isSaving} onAdd={openItemModal} onEdit={editItem} onRemove={(id) => setItems((current) => current.filter((item) => item.id !== id))} onSave={saveRoutine} />}
      {screen === 'my-workouts' && <MyWorkoutsScreen routines={savedRoutines} isLoading={isLoadingRoutines} onCreate={() => setScreen('builder')} />}
      {modalState && <ItemModal exercise={modalState.exercise} isEditing={Boolean(modalState.itemId)} form={itemForm} setForm={setItemForm} onClose={() => setModalState(null)} onSubmit={saveItem} />}
    </div>
  </main>;
}

function Nav({ screen, onNavigate }) {
  const links = [{ id: 'home', label: 'Início' }, { id: 'builder', label: 'Criar rotina' }, { id: 'my-workouts', label: 'Meus treinos' }];
  return <header className="mx-auto flex max-w-7xl items-center justify-between gap-4 px-5 py-6 sm:px-8"><button onClick={() => onNavigate('home')} className="flex items-center gap-3"><span className="rounded-xl bg-indigo-500 p-2.5 shadow-lg shadow-indigo-500/30"><Dumbbell size={21} /></span><span className="text-lg font-black tracking-tight text-white">GYM<span className="text-indigo-400">PLAN</span></span></button><nav className="flex rounded-xl border border-white/10 bg-zinc-900/70 p-1 shadow-lg shadow-indigo-500/10 backdrop-blur">{links.map((link) => <button key={link.id} onClick={() => onNavigate(link.id)} className={`rounded-lg px-3 py-2 text-sm font-semibold transition duration-200 sm:px-4 ${screen === link.id ? 'bg-indigo-500 text-white shadow-md shadow-indigo-500/25' : 'text-zinc-400 hover:bg-white/5 hover:text-white'}`}>{link.label}</button>)}</nav></header>;
}

function Notice({ notice }) { return <div className={`fixed right-5 top-5 z-50 flex max-w-sm items-center gap-3 rounded-xl border px-4 py-3 text-sm shadow-2xl ${notice.type === 'success' ? 'border-emerald-400/30 bg-emerald-950 text-emerald-100' : 'border-rose-400/30 bg-rose-950 text-rose-100'}`}>{notice.type === 'success' ? <CheckCircle2 size={19} /> : <X size={19} />}<span>{notice.text}</span></div>; }

function HomeScreen({ onCreate, availableExercises }) { return <div className="mx-auto flex min-h-[calc(100vh-88px)] max-w-6xl items-center px-6 pb-16 sm:px-10"><section className="grid w-full items-center gap-10 lg:grid-cols-[1.25fr_.75fr]"><div><p className="mb-4 font-bold uppercase tracking-[.2em] text-indigo-400">Gestão inteligente de treino</p><h1 className="max-w-3xl text-4xl font-black leading-tight tracking-tight text-white sm:text-6xl">Planeje treinos que deixam resultado.</h1><p className="mt-6 max-w-xl text-lg leading-8 text-zinc-400">Crie fichas personalizadas, organize exercícios e acompanhe sua progressão em uma experiência pensada para performance.</p><button onClick={onCreate} className="mt-9 inline-flex items-center gap-2 rounded-xl bg-indigo-500 px-6 py-4 font-bold text-white shadow-xl shadow-indigo-500/25 transition duration-200 hover:-translate-y-0.5 hover:bg-indigo-400 hover:shadow-indigo-500/40"><Plus size={20} /> Criar nova rotina <ChevronRight size={19} /></button></div><StatCard icon={<Dumbbell />} value={availableExercises} label="Exercícios disponíveis" /></section></div>; }
function StatCard({ icon, value, label }) { return <div className="rounded-2xl border border-white/10 bg-zinc-900/70 p-6 shadow-2xl shadow-indigo-500/10 backdrop-blur transition duration-300 hover:-translate-y-1 hover:border-indigo-400/30"><div className="mb-8 w-fit rounded-xl bg-indigo-500/15 p-3 text-indigo-300">{icon}</div><p className="text-5xl font-black tracking-tight text-white">{value}</p><p className="mt-2 text-sm font-medium text-zinc-400">{label}</p></div>; }

function BuilderScreen({ categories, exercises, selectedCategory, setSelectedCategory, routine, setRoutine, items, isLoading, isSaving, onAdd, onEdit, onRemove, onSave }) { return <div className="mx-auto max-w-7xl px-5 pb-10 sm:px-8"><header className="mb-8 flex flex-wrap items-center justify-between gap-4 border-b border-white/10 pb-6"><div><p className="text-xs font-bold uppercase tracking-[.18em] text-indigo-400">Construtor de treino</p><h1 className="mt-1 text-3xl font-black text-white">Monte uma ficha memorável</h1></div><div className="flex items-center gap-2 text-sm text-zinc-400"><Dumbbell size={17} className="text-indigo-400" /> {items.length} exercício{items.length !== 1 ? 's' : ''} selecionado{items.length !== 1 ? 's' : ''}</div></header><div className="grid gap-7 lg:grid-cols-4"><section className="lg:col-span-3"><div className="mb-5 flex gap-2 overflow-x-auto pb-2"><CategoryButton active={selectedCategory === 'all'} onClick={() => setSelectedCategory('all')}>Todos</CategoryButton>{categories.map((category) => <CategoryButton key={category.id} active={String(selectedCategory) === String(category.id)} onClick={() => setSelectedCategory(category.id)}>{category.nome}</CategoryButton>)}</div>{isLoading ? <div className="flex min-h-64 items-center justify-center text-zinc-400"><LoaderCircle className="mr-2 animate-spin" /> Carregando catálogo...</div> : exercises.length ? <div className="grid gap-4 sm:grid-cols-2 xl:grid-cols-3">{exercises.map((exercise) => <ExerciseCard key={exercise.id} exercise={exercise} categories={categories} onAdd={() => onAdd(exercise)} />)}</div> : <EmptyState text="Nenhum exercício encontrado nesta categoria." />}</section><RoutineCart routine={routine} setRoutine={setRoutine} items={items} isSaving={isSaving} onEdit={onEdit} onRemove={onRemove} onSave={onSave} /></div></div>; }
function CategoryButton({ active, onClick, children }) { return <button onClick={onClick} className={`shrink-0 rounded-full px-4 py-2 text-sm font-semibold transition ${active ? 'bg-indigo-500 text-white shadow-lg shadow-indigo-500/20' : 'bg-zinc-900 text-zinc-400 hover:bg-zinc-800 hover:text-zinc-100'}`}>{children}</button>; }
function ExerciseImage({ exercise, categories = [], className = '' }) { const fallbackUrl = CATEGORY_IMAGES[normalizeCategoryName(getCategoryName(exercise, categories))] || 'https://images.unsplash.com/photo-1517836357463-d25dfeac3438?auto=format&fit=crop&w=900&q=80'; return <img src={getImageUrl(exercise, categories)} alt={`Execução do exercício ${exercise.nome}`} loading="lazy" onError={(event) => { if (event.currentTarget.src !== fallbackUrl) event.currentTarget.src = fallbackUrl; }} className={className} />; }
function ExerciseCard({ exercise, categories, onAdd }) { return <article className="group overflow-hidden rounded-2xl border border-white/10 bg-zinc-900/80 shadow-lg shadow-indigo-500/10 transition duration-300 hover:-translate-y-1 hover:border-indigo-400/30"><div className="overflow-hidden"><ExerciseImage exercise={exercise} categories={categories} className="h-36 w-full object-cover opacity-75 transition duration-300 group-hover:scale-105 group-hover:opacity-100" /></div><div className="p-4"><h2 className="truncate font-bold text-white">{exercise.nome}</h2><p className="mt-1 h-5 text-xs text-zinc-500">{getCategoryName(exercise, categories)}</p><button onClick={onAdd} className="mt-4 flex w-full items-center justify-center gap-2 rounded-lg bg-white/10 px-3 py-2.5 text-sm font-bold text-zinc-100 transition hover:bg-indigo-500"><Plus size={17} /> Adicionar</button></div></article>; }
function RoutineCart({ routine, setRoutine, items, isSaving, onEdit, onRemove, onSave }) { return <aside className="h-fit rounded-2xl border border-white/10 bg-zinc-900/80 p-5 shadow-2xl shadow-indigo-500/10 backdrop-blur lg:sticky lg:top-6"><div className="mb-5 flex items-center gap-2"><ClipboardList className="text-indigo-400" size={21} /><h2 className="font-bold text-white">Ficha em construção</h2></div><label className="mb-4 block text-xs font-semibold uppercase tracking-wider text-zinc-500">Nome do treino<input value={routine.nomeTreino} onChange={(event) => setRoutine((current) => ({ ...current, nomeTreino: event.target.value }))} className="mt-2 w-full rounded-lg border border-zinc-700 bg-zinc-950 px-3 py-2.5 text-sm text-white outline-none transition focus:border-indigo-500" placeholder="Ex.: Treino A" /></label><div className="my-5 border-t border-white/10" /><div className="max-h-64 space-y-3 overflow-y-auto pr-1">{items.length ? items.map((item) => <div key={item.id} className="rounded-xl border border-white/5 bg-zinc-950 p-3 transition hover:border-indigo-400/20"><div className="flex items-start justify-between gap-2"><p className="text-sm font-semibold text-zinc-100">{item.exercicio.nome}</p><div className="flex gap-1"><button onClick={() => onEdit(item)} className="rounded p-1 text-zinc-500 transition hover:bg-indigo-500/15 hover:text-indigo-300" aria-label={`Editar ${item.exercicio.nome}`}><Pencil size={16} /></button><button onClick={() => onRemove(item.id)} className="rounded p-1 text-zinc-500 transition hover:bg-rose-500/15 hover:text-rose-400" aria-label={`Remover ${item.exercicio.nome}`}><Trash2 size={16} /></button></div></div><p className="mt-1 text-xs text-zinc-400">{item.series} séries · {item.repeticoes} reps · {item.peso} kg</p></div>) : <p className="py-5 text-center text-sm text-zinc-500">Seu treino ainda não possui exercícios.</p>}</div><button onClick={onSave} disabled={isSaving} className="mt-5 flex w-full items-center justify-center gap-2 rounded-xl bg-indigo-500 px-4 py-3.5 text-sm font-bold text-white shadow-lg shadow-indigo-500/20 transition hover:bg-indigo-400 hover:shadow-indigo-500/35 disabled:cursor-not-allowed disabled:opacity-60">{isSaving ? <LoaderCircle size={18} className="animate-spin" /> : <CheckCircle2 size={18} />}{isSaving ? 'Salvando...' : 'Salvar rotina'}</button></aside>; }

function MyWorkoutsScreen({ routines, isLoading, onCreate }) { const [selectedRoutine, setSelectedRoutine] = useState(null); return <div className="mx-auto max-w-7xl px-5 pb-12 sm:px-8"><header className="mb-8 flex flex-wrap items-end justify-between gap-4"><div><p className="text-xs font-bold uppercase tracking-[.18em] text-indigo-400">Biblioteca de performance</p><h1 className="mt-1 text-3xl font-black text-white">Meus treinos</h1><p className="mt-2 text-zinc-400">Acesse suas fichas e acompanhe a evolução de cada carga.</p></div><button onClick={onCreate} className="inline-flex items-center gap-2 rounded-xl bg-indigo-500 px-4 py-3 text-sm font-bold text-white shadow-lg shadow-indigo-500/20 transition hover:bg-indigo-400"><Plus size={18} /> Nova rotina</button></header>{isLoading ? <div className="flex min-h-64 items-center justify-center text-zinc-400"><LoaderCircle className="mr-2 animate-spin" /> Carregando treinos...</div> : routines.length ? <div className="grid gap-5 md:grid-cols-2 xl:grid-cols-3">{routines.map((routine, index) => <WorkoutCard key={routine.id ?? `${getRoutineName(routine)}-${index}`} routine={routine} onOpen={() => setSelectedRoutine(routine)} />)}</div> : <EmptyState text="Você ainda não salvou nenhuma rotina." actionLabel="Criar primeira rotina" onAction={onCreate} />}{selectedRoutine && <WorkoutDetails routine={selectedRoutine} routines={routines} onClose={() => setSelectedRoutine(null)} />}</div>; }
function WorkoutCard({ routine, onOpen }) { const itemCount = getRoutineItems(routine).length; return <article className="rounded-2xl border border-white/10 bg-zinc-900/75 p-6 shadow-xl shadow-indigo-500/10 transition duration-300 hover:-translate-y-1 hover:border-indigo-400/30"><div className="mb-7 flex items-center justify-between"><span className="rounded-xl bg-indigo-500/15 p-3 text-indigo-300"><ClipboardList size={22} /></span><span className="text-xs font-bold uppercase tracking-wider text-zinc-500">{itemCount} exercício{itemCount !== 1 ? 's' : ''}</span></div><h2 className="text-xl font-bold text-white">{getRoutineName(routine)}</h2><p className="mt-2 text-sm text-zinc-400">Ficha personalizada pronta para o próximo treino.</p><button onClick={onOpen} className="mt-6 flex w-full items-center justify-center gap-2 rounded-xl bg-white/10 px-4 py-3 text-sm font-bold text-white transition hover:bg-indigo-500">Acessar treino <ChevronRight size={17} /></button></article>; }
function WorkoutDetails({ routine, routines, onClose }) { const [evolutionItem, setEvolutionItem] = useState(null); const items = getRoutineItems(routine); return <div className="fixed inset-0 z-40 overflow-y-auto bg-black/75 p-4 backdrop-blur-sm sm:p-8"><section className="mx-auto my-6 max-w-3xl rounded-2xl border border-white/10 bg-gradient-to-br from-zinc-900 to-zinc-950 p-6 shadow-2xl shadow-indigo-500/10"><div className="flex items-start justify-between gap-5"><div><p className="text-xs font-bold uppercase tracking-[.18em] text-indigo-400">Detalhes da rotina</p><h2 className="mt-1 text-3xl font-black text-white">{getRoutineName(routine)}</h2></div><button onClick={onClose} className="rounded-lg p-2 text-zinc-400 transition hover:bg-white/10 hover:text-white" aria-label="Fechar detalhes"><X /></button></div><div className="mt-7 space-y-3">{items.map((item, index) => { const exercise = getItemExercise(item); const history = routines.flatMap((savedRoutine) => getRoutineItems(savedRoutine)).filter((savedItem) => { const savedExercise = getItemExercise(savedItem); return savedExercise.id && exercise.id ? String(savedExercise.id) === String(exercise.id) : savedExercise.nome === exercise.nome; }).map((savedItem) => Number(savedItem.peso) || 0); return <div key={item.id ?? `${exercise.id}-${index}`} className="rounded-xl border border-white/10 bg-zinc-950/80 p-4"><div className="flex flex-wrap items-center justify-between gap-3"><div><h3 className="font-bold text-white">{exercise.nome}</h3><p className="mt-1 text-sm text-zinc-400">{item.series} séries · {item.repeticoes} repetições · <span className="font-semibold text-indigo-300">{item.peso} kg</span></p></div><button onClick={() => setEvolutionItem(evolutionItem === index ? null : index)} className="inline-flex items-center gap-2 rounded-lg border border-indigo-400/20 bg-indigo-500/10 px-3 py-2 text-xs font-bold text-indigo-300 transition hover:bg-indigo-500 hover:text-white"><BarChart3 size={15} /> Ver evolução de carga <ChevronDown size={14} className={`transition ${evolutionItem === index ? 'rotate-180' : ''}`} /></button></div>{evolutionItem === index && <EvolutionPanel history={history} currentWeight={Number(item.peso) || 0} />}</div>; })}</div></section></div>; }
function EvolutionPanel({ history, currentWeight }) { const hasHistory = history.length > 1; const points = hasHistory ? history.slice(-4) : [Math.max(0, currentWeight - 10), Math.max(0, currentWeight - 5), currentWeight]; const max = Math.max(...points, 1); return <div className="mt-4 rounded-lg border border-indigo-400/10 bg-indigo-500/5 p-4"><div className="mb-4 flex items-center justify-between"><p className="text-xs font-bold uppercase tracking-wider text-indigo-300">{hasHistory ? 'Histórico de carga' : 'Evolução simulada de carga'}</p><span className="text-xs text-zinc-400">Últimas {points.length} sessões</span></div><div className="flex h-24 items-end gap-3">{points.map((point, index) => <div key={index} className="flex flex-1 flex-col items-center gap-2"><span className="text-xs font-bold text-white">{point} kg</span><div className="w-full max-w-20 rounded-t-md bg-gradient-to-t from-indigo-600 to-indigo-400 shadow-lg shadow-indigo-500/25 transition-all" style={{ height: `${Math.max(12, (point / max) * 100)}%` }} /><span className="text-[10px] text-zinc-500">Sessão {index + 1}</span></div>)}</div></div>; }
function EmptyState({ text, actionLabel, onAction }) { return <div className="rounded-2xl border border-dashed border-zinc-700 bg-zinc-900/50 p-10 text-center text-zinc-400"><p>{text}</p>{actionLabel && <button onClick={onAction} className="mt-5 rounded-lg bg-indigo-500 px-4 py-2.5 text-sm font-bold text-white transition hover:bg-indigo-400">{actionLabel}</button>}</div>; }
function ItemModal({ exercise, isEditing, form, setForm, onClose, onSubmit }) { const updateField = (field, value) => setForm((current) => ({ ...current, [field]: value })); return <div className="fixed inset-0 z-40 flex items-center justify-center bg-black/70 p-5 backdrop-blur-sm" role="dialog" aria-modal="true"><form onSubmit={onSubmit} className="w-full max-w-md overflow-hidden rounded-2xl border border-white/10 bg-gradient-to-br from-zinc-900 to-zinc-950 shadow-2xl shadow-indigo-500/10"><ExerciseImage exercise={exercise} className="h-40 w-full object-cover" /><div className="p-6"><div className="flex items-start justify-between gap-4"><div><p className="text-xs font-bold uppercase tracking-wider text-indigo-400">{isEditing ? 'Editar exercício' : 'Adicionar à rotina'}</p><h2 className="mt-1 text-xl font-bold text-white">{exercise.nome}</h2></div><button type="button" onClick={onClose} className="rounded-lg p-1 text-zinc-400 transition hover:bg-zinc-800 hover:text-white"><X /></button></div><div className="mt-6 grid grid-cols-3 gap-3"><NumberField label="Séries" value={form.series} onChange={(value) => updateField('series', value)} min="1" step="1" /><NumberField label="Repetições" value={form.repeticoes} onChange={(value) => updateField('repeticoes', value)} min="1" step="1" /><NumberField label="Peso (kg)" value={form.peso} onChange={(value) => updateField('peso', value)} min="0" step="0.5" /></div><div className="mt-7 flex justify-end gap-3"><button type="button" onClick={onClose} className="rounded-lg px-4 py-2.5 text-sm font-semibold text-zinc-400 transition hover:text-white">Cancelar</button><button type="submit" className="rounded-lg bg-indigo-500 px-4 py-2.5 text-sm font-bold text-white transition hover:bg-indigo-400">{isEditing ? 'Salvar alterações' : 'Adicionar exercício'}</button></div></div></form></div>; }
function NumberField({ label, value, onChange, min, step }) { return <label className="text-xs font-semibold uppercase tracking-wider text-zinc-500">{label}<input required type="number" min={min} step={step} value={value} onChange={(event) => onChange(event.target.value)} className="mt-2 w-full rounded-lg border border-zinc-700 bg-zinc-950 px-3 py-2.5 text-sm text-white outline-none transition focus:border-indigo-500" /></label>; }

export default App;
