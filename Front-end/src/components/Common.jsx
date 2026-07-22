export function EmptyState({ text, actionLabel, onAction }) {
  return <div className="rounded-2xl border border-dashed border-zinc-700 bg-zinc-900/50 p-10 text-center text-zinc-400"><p>{text}</p>{actionLabel && <button onClick={onAction} className="mt-5 rounded-lg bg-orange-500 px-4 py-2.5 text-sm font-bold text-white transition hover:bg-orange-400">{actionLabel}</button>}</div>;
}

export function NumberField({ label, value, onChange, min, step }) {
  return <label className="text-xs font-semibold uppercase tracking-wider text-zinc-500">{label}<input required type="number" min={min} step={step} value={value} onChange={(event) => onChange(event.target.value)} className="mt-2 w-full rounded-lg border border-zinc-700 bg-zinc-950 px-3 py-2.5 text-sm text-white outline-none transition focus:border-orange-500" /></label>;
}
