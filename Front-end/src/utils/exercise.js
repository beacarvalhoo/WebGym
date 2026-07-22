const CATEGORY_IMAGES = {
  pernas: 'https://images.unsplash.com/photo-1574680096145-d05b474e2155?auto=format&fit=crop&w=900&q=80',
  peito: 'https://images.unsplash.com/photo-1581009146145-b5ef050c2e1e?auto=format&fit=crop&w=900&q=80',
  costas: 'https://images.unsplash.com/photo-1534438327276-14e5300c3a48?auto=format&fit=crop&w=900&q=80',
  ombros: 'https://images.unsplash.com/photo-1583454110551-21f2fa2afe61?auto=format&fit=crop&w=900&q=80',
  biceps: 'https://images.unsplash.com/photo-1583454110551-21f2fa2afe61?auto=format&fit=crop&w=900&q=80',
  triceps: 'https://images.unsplash.com/photo-1583454110551-21f2fa2afe61?auto=format&fit=crop&w=900&q=80',
  abdomen: 'https://images.unsplash.com/photo-1579758629938-03607ccdbaba?auto=format&fit=crop&w=900&q=80',
  gluteos: 'https://images.unsplash.com/photo-1574680096145-d05b474e2155?auto=format&fit=crop&w=900&q=80',
};

const DEFAULT_IMAGE = 'https://images.unsplash.com/photo-1517836357463-d25dfeac3438?auto=format&fit=crop&w=900&q=80';
const normalize = (name = '') => name.normalize('NFD').replace(/[\u0300-\u036f]/g, '').toLowerCase();

export const getCategoryId = (exercise) => exercise.categoria?.id ?? exercise.categoriaId ?? exercise.idCategoria;
export const getCategoryName = (exercise, categories = []) => exercise.categoria?.nome
  ?? categories.find((category) => String(category.id) === String(getCategoryId(exercise)))?.nome
  ?? 'Exercício';
export const getFallbackImage = (exercise, categories = []) => CATEGORY_IMAGES[normalize(getCategoryName(exercise, categories))] || DEFAULT_IMAGE;
export const getImageUrl = (exercise, categories = []) => {
  const imageUrl = (exercise.urlImagem ?? exercise.imagemUrl ?? exercise.imagem ?? exercise.foto)?.trim();
  return imageUrl && !imageUrl.toLowerCase().includes('exemplo.com') ? imageUrl : getFallbackImage(exercise, categories);
};
export const getWorkoutItems = (workout) => workout.itens ?? workout.itensTreino ?? workout.exercicios ?? [];
export const getItemExercise = (item) => item.exercicio ?? item.exercise ?? { id: item.exercicioId, nome: item.nomeExercicio ?? 'Exercício' };
export const getWorkoutName = (workout) => workout.nomeTreino ?? workout.nome ?? 'Treino sem nome';
