import { Plus } from 'lucide-react';
import { getCategoryName, getFallbackImage, getImageUrl } from '../utils/exercise';

export function ExerciseImage({ exercise, categories = [], className = '' }) {
  const fallbackUrl = getFallbackImage(exercise, categories);
  return <img src={getImageUrl(exercise, categories)} alt={`Execução do exercício ${exercise.nome}`} loading="lazy" onError={(event) => { if (event.currentTarget.src !== fallbackUrl) event.currentTarget.src = fallbackUrl; }} className={className} />;
}

export function ExerciseCard({ exercise, categories, onAdd }) {
  return <article className="group overflow-hidden rounded-2xl border border-white/10 bg-zinc-900/80 shadow-lg shadow-orange-500/10 transition duration-300 hover:-translate-y-1 hover:border-orange-400/30"><div className="overflow-hidden"><ExerciseImage exercise={exercise} categories={categories} className="h-36 w-full object-cover opacity-75 transition duration-300 group-hover:scale-105 group-hover:opacity-100" /></div><div className="p-4"><h2 className="truncate font-bold text-white">{exercise.nome}</h2><p className="mt-1 h-5 text-xs text-zinc-500">{getCategoryName(exercise, categories)}</p><button onClick={onAdd} className="mt-4 flex w-full items-center justify-center gap-2 rounded-lg bg-white/10 px-3 py-2.5 text-sm font-bold text-zinc-100 transition hover:bg-orange-500"><Plus size={17} /> Adicionar</button></div></article>;
}

export function CategoryButton({ active, onClick, children }) {
  return <button onClick={onClick} className={`shrink-0 rounded-full px-4 py-2 text-sm font-semibold transition ${active ? 'bg-orange-500 text-white shadow-lg shadow-orange-500/20' : 'bg-zinc-900 text-zinc-400 hover:bg-zinc-800 hover:text-zinc-100'}`}>{children}</button>;
}
