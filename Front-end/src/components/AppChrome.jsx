import { CheckCircle2, X } from 'lucide-react';

export function Nav({ screen, onNavigate }) {
  const links = [{ id: 'home', label: 'Início' }, { id: 'builder', label: 'Criar treino' }, { id: 'my-workouts', label: 'Meus treinos' }];
  return <header className="mx-auto flex max-w-7xl items-center justify-between gap-4 px-5 py-6 sm:px-8"><button onClick={() => onNavigate('home')} className="flex items-center gap-2"><img src="/peak-logo.svg" alt="" className="h-11 w-11" /><span className="text-xl font-black tracking-tight text-white">Pe<span className="text-rose-400">ak</span></span></button><nav className="flex rounded-xl border border-white/10 bg-zinc-900/70 p-1 shadow-lg shadow-rose-500/10 backdrop-blur">{links.map((link) => <button key={link.id} onClick={() => onNavigate(link.id)} className={`rounded-lg px-3 py-2 text-sm font-semibold transition duration-200 sm:px-4 ${screen === link.id ? 'bg-rose-400 text-zinc-950 shadow-md shadow-rose-500/20' : 'text-zinc-400 hover:bg-white/5 hover:text-white'}`}>{link.label}</button>)}</nav></header>;
}

export function Notice({ notice }) {
  return <div className={`fixed right-5 top-5 z-50 flex max-w-sm items-center gap-3 rounded-xl border px-4 py-3 text-sm shadow-2xl ${notice.type === 'success' ? 'border-emerald-400/30 bg-emerald-950 text-emerald-100' : 'border-rose-400/30 bg-rose-950 text-rose-100'}`}>{notice.type === 'success' ? <CheckCircle2 size={19} /> : <X size={19} />}<span>{notice.text}</span></div>;
}
