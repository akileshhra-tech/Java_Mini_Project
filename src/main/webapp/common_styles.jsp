<%-- common_styles.jspf : include at the top of every page --%>
<style>
  @import url('https://fonts.googleapis.com/css2?family=DM+Serif+Display&family=DM+Sans:wght@400;500;600&display=swap');

  *, *::before, *::after { box-sizing: border-box; margin: 0; padding: 0; }

  :root {
    --bg:       #0f1117;
    --surface:  #1a1d27;
    --card:     #21243a;
    --border:   #2e3250;
    --accent:   #5b6af0;
    --accent2:  #7c3aed;
    --green:    #22c55e;
    --red:      #ef4444;
    --amber:    #f59e0b;
    --text:     #e8eaf6;
    --muted:    #8b8fa8;
    --radius:   12px;
  }

  body {
    font-family: 'DM Sans', sans-serif;
    background: var(--bg);
    color: var(--text);
    min-height: 100vh;
  }

  /* ── NAV ── */
  nav {
    background: var(--surface);
    border-bottom: 1px solid var(--border);
    padding: 0 2rem;
    display: flex;
    align-items: center;
    gap: 0;
    height: 60px;
    position: sticky;
    top: 0;
    z-index: 100;
  }
  .nav-brand {
    font-family: 'DM Serif Display', serif;
    font-size: 1.25rem;
    color: var(--accent);
    margin-right: 2rem;
    text-decoration: none;
    white-space: nowrap;
  }
  .nav-links { display: flex; gap: 0.25rem; }
  .nav-links a {
    color: var(--muted);
    text-decoration: none;
    padding: 0.4rem 0.85rem;
    border-radius: 8px;
    font-size: 0.875rem;
    font-weight: 500;
    transition: all 0.15s;
  }
  .nav-links a:hover, .nav-links a.active {
    background: var(--card);
    color: var(--text);
  }

  /* ── LAYOUT ── */
  .container { max-width: 960px; margin: 2.5rem auto; padding: 0 1.5rem; }
  .page-title {
    font-family: 'DM Serif Display', serif;
    font-size: 1.85rem;
    margin-bottom: 1.5rem;
    color: var(--text);
  }
  .page-title span { color: var(--accent); }

  /* ── CARD ── */
  .card {
    background: var(--card);
    border: 1px solid var(--border);
    border-radius: var(--radius);
    padding: 1.75rem;
    margin-bottom: 1.5rem;
  }

  /* ── FORM ── */
  .form-group { margin-bottom: 1.1rem; }
  label { display: block; font-size: 0.8rem; font-weight: 600; color: var(--muted); margin-bottom: 0.4rem; letter-spacing: .05em; text-transform: uppercase; }
  input[type=text], input[type=number], select {
    width: 100%; padding: 0.65rem 0.9rem;
    background: var(--surface); border: 1px solid var(--border);
    border-radius: 8px; color: var(--text); font-size: 0.9rem;
    font-family: inherit; outline: none; transition: border 0.2s;
  }
  input:focus, select:focus { border-color: var(--accent); }
  select option { background: var(--surface); }

  /* ── BUTTONS ── */
  .btn {
    display: inline-block; padding: 0.65rem 1.4rem;
    border: none; border-radius: 8px; font-size: 0.875rem;
    font-weight: 600; font-family: inherit;
    cursor: pointer; text-decoration: none;
    transition: filter 0.15s, transform 0.1s;
  }
  .btn:hover   { filter: brightness(1.1); }
  .btn:active  { transform: scale(0.98); }
  .btn-primary { background: var(--accent); color: #fff; }
  .btn-danger  { background: var(--red);    color: #fff; }
  .btn-warning { background: var(--amber);  color: #000; }
  .btn-ghost   { background: var(--border); color: var(--text); }
  .btn-sm      { padding: 0.35rem 0.9rem; font-size: 0.8rem; }

  /* ── ALERT ── */
  .alert {
    padding: 0.85rem 1rem; border-radius: 8px;
    margin-bottom: 1.25rem; font-size: 0.9rem; font-weight: 500;
  }
  .alert-success { background: #14532d55; border: 1px solid var(--green);  color: var(--green); }
  .alert-error   { background: #7f1d1d55; border: 1px solid var(--red);    color: var(--red);   }

  /* ── TABLE ── */
  .table-wrap { overflow-x: auto; }
  table { width: 100%; border-collapse: collapse; font-size: 0.875rem; }
  thead tr { background: var(--surface); }
  th { padding: 0.75rem 1rem; text-align: left; color: var(--muted); font-size: 0.75rem; text-transform: uppercase; letter-spacing: .06em; border-bottom: 1px solid var(--border); }
  td { padding: 0.75rem 1rem; border-bottom: 1px solid var(--border); }
  tbody tr:hover { background: #ffffff08; }
  tbody tr:last-child td { border-bottom: none; }

  /* ── BADGE ── */
  .badge {
    display: inline-block; padding: 0.2rem 0.65rem;
    border-radius: 999px; font-size: 0.72rem; font-weight: 600;
  }
  .badge-blue   { background: #3730a322; color: #818cf8; border: 1px solid #3730a366; }
  .badge-green  { background: #14532d22; color: var(--green); border: 1px solid #14532d66; }

  /* ── EMPTY STATE ── */
  .empty { text-align: center; padding: 3rem; color: var(--muted); }
  .empty-icon { font-size: 3rem; margin-bottom: 0.75rem; }

  /* ── STAT CARDS ── */
  .stats { display: grid; grid-template-columns: repeat(auto-fit, minmax(160px,1fr)); gap: 1rem; margin-bottom: 1.5rem; }
  .stat-card { background: var(--card); border: 1px solid var(--border); border-radius: var(--radius); padding: 1.2rem; }
  .stat-card .stat-val { font-size: 1.6rem; font-weight: 700; color: var(--accent); }
  .stat-card .stat-lbl { font-size: 0.78rem; color: var(--muted); margin-top: 0.25rem; }
</style>
