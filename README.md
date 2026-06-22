<!-- ═══════════════════════════════════════════════════════════════════
     ASAKUSHEN · GitHub Profile README
     Design: Terminal-dark · Grain · Bento grid · Single palette
     All visual styles are INLINE — no <style> blocks, GitHub-compatible
═══════════════════════════════════════════════════════════════════ -->

<!-- ══ Grain texture (SVG feTurbulence, hidden reference) ══ -->
<svg xmlns="http://www.w3.org/2000/svg" width="256" height="256" style="display:none">
  <filter id="gn">
    <feTurbulence type="fractalNoise" baseFrequency="0.75" numOctaves="3" stitchTiles="stitch"/>
    <feColorMatrix values="0 0 0 0 0.12 0 0 0 0 0.1 0 0 0 0 0.18 0 0 0 0.09 0"/>
  </filter>
  <rect width="100%" height="100%" filter="url(#gn)"/>
</svg>

<!-- ══ Header accent line (SMIL animated) ══ -->
<svg xmlns="http://www.w3.org/2000/svg" height="22" viewBox="0 0 560 22" style="display:block;width:100%;max-width:560px;height:auto;margin:0 auto;">
  <defs>
    <linearGradient id="ahg" x1="0%" y1="0%" x2="100%" y2="0%">
      <stop offset="0%"  stop-color="#6366f1"><animate attributeName="stop-color" values="#6366f1;#818cf8;#a78bfa;#6366f1" dur="7s" repeatCount="indefinite"/></stop>
      <stop offset="50%" stop-color="#818cf8"><animate attributeName="stop-color" values="#818cf8;#a78bfa;#6366f1;#818cf8" dur="6s" repeatCount="indefinite"/></stop>
      <stop offset="100%"stop-color="#10b981"><animate attributeName="stop-color" values="#10b981;#6366f1;#818cf8;#10b981" dur="8s" repeatCount="indefinite"/></stop>
    </linearGradient>
  </defs>
  <line x1="0" y1="0"   x2="560" y2="0"  stroke="url(#ahg)" stroke-width="1.5"/>
  <line x1="0" y1="5.5" x2="560" y2="5.5" stroke="url(#ahg)" stroke-width="0.4" opacity="0.25">
    <animate attributeName="x1"      values="0;120;-60;0"    dur="12s" repeatCount="indefinite"/>
    <animate attributeName="x2"      values="560;680;620;560" dur="12s" repeatCount="indefinite"/>
    <animate attributeName="opacity" values="0.15;0.4;0.15" dur="3.5s" repeatCount="indefinite"/>
  </line>
  <line x1="0" y1="9.5" x2="560" y2="9.5" stroke="#6366f1" stroke-width="0.25" opacity="0.15"/>
</svg>

---

<!-- ════════════════════════════════════════════════════════════
     01 TERMINAL — ASCII-style system intro
═══════════════════════════════════════════════════════════ -->

<div align="center" style="padding:36px 0 0;">
  <div style="display:flex;align-items:center;gap:10px;margin-bottom:18px;max-width:720px;margin-left:auto;margin-right:auto;">
    <span style="font-family:ui-monospace,monospace;font-size:10px;letter-spacing:1.3px;color:#6366f1;text-transform:uppercase;">01 — hello</span>
    <div style="flex:1;height:1px;background:linear-gradient(90deg,rgba(99,102,241,0.22),transparent);"></div>
  </div>

  <!-- ASCII Terminal -->
  <div style="background:#04040a;border:1px solid rgba(99,102,241,0.14);border-radius:16px;padding:28px 26px 24px;text-align:left;font-family:ui-monospace,SF Mono,Menlo,monospace;font-size:12px;line-height:15.5px;max-width:720px;margin:0 auto;overflow-x:auto;">
<pre style="background:transparent;border:none;padding:0;margin:0;color:#8d94a6;"><span style="color:#6366f1;font-weight:500;">❯</span> <span style="color:#64697a;">whoami</span>
<span style="color:#10b981;">Full-Stack Developer</span> <span style="color:#64697a;">·</span> <span style="color:#8d94a6;">Open Source Enthusiast</span>
<span style="color:#6366f1;font-weight:500;">❯</span> <span style="color:#64697a;">cat location.txt</span>
<span style="color:#64697a;">36.2048° N</span><span style="color:#3e4355;">, 18° E — web / network / cli</span>
<span style="color:#6366f1;font-weight:500;">❯</span> <span style="color:#64697a;">ls skills/</span>
<span style="color:#64697a;">Python</span>  <span style="color:#3e4355;">████████░░</span>  <span style="color:#3e4355;">C/C++</span>   <span style="color:#3e4355;">██████░░░░</span>
<span style="color:#64697a;">JS</span>      <span style="color:#3e4355;">████████░░</span>  <span style="color:#3e4355;">HTML/CSS</span> <span style="color:#3e4355;">████████░░</span>
<span style="color:#64697a;">Django</span>   <span style="color:#3e4355;">██████░░░░</span>  <span style="color:#3e4355;">DevOps</span>   <span style="color:#3e4355;">█████░░░░░</span>
<span style="color:#6366f1;font-weight:500;">❯</span> <span style="color:#64697a;">echo $FOCUS</span>
<span style="color:#3e4355;">distributed_sys</span> <span style="color:#3e4355;">·</span> <span style="color:#10b981;">open_source</span> <span style="color:#3e4355;">·</span> <span style="color:#a78bfa;">web_perf</span>
<span style="color:#6366f1;font-weight:500;">❯</span> <span style="color:#f59e0b;">█</span></pre>
  </div>

  <div align="center" style="display:flex;flex-wrap:wrap;justify-content:center;gap:8px;margin-top:18px;">
    <span style="display:inline-flex;align-items:center;gap:6px;padding:6px 14px;border-radius:9999px;background:rgba(16,185,129,0.1);border:1px solid rgba(16,185,129,0.18);color:#10b981;font-size:13px;font-weight:450;">
      <span style="width:7px;height:7px;border-radius:50%;background:#10b981;box-shadow:0 0 7px rgba(16,185,129,0.55);"></span> Open to collaborate
    </span>
    <a href="https://www.chillg.de" style="display:inline-flex;align-items:center;padding:6px 14px;border-radius:9999px;background:rgba(99,102,241,0.1);border:1px solid rgba(99,102,241,0.18);color:#818cf8;text-decoration:none;font-size:13px;font-weight:450;">🌐 chillg.de</a>
    <a href="mailto:hi@chillg.de" style="display:inline-flex;align-items:center;padding:6px 14px;border-radius:9999px;background:rgba(99,102,241,0.08);border:1px solid rgba(99,102,241,0.12);color:#818cf8;text-decoration:none;font-size:13px;font-weight:450;">✉ hi@chillg.de</a>
  </div>
</div>

---

<!-- ════════════════════════════════════════════════════════════
     02 BENTO GRID — Stats + Visual overview
═══════════════════════════════════════════════════════════ -->

<div align="center" style="max-width:720px;margin:42px auto 0;padding:0;">
  <div style="display:flex;align-items:center;gap:10px;margin-bottom:18px;">
    <span style="font-family:ui-monospace,monospace;font-size:10px;letter-spacing:1.3px;color:#6366f1;text-transform:uppercase;">02 — overview</span>
    <div style="flex:1;height:1px;background:linear-gradient(90deg,rgba(99,102,241,0.22),transparent);"></div>
  </div>
</div>

<div style="display:grid;grid-template-columns:1fr 1fr;gap:14px;max-width:720px;margin:0 auto;">

  <!-- Card A: GitHub Stats (WIDE) -->
  <div style="background:#04040a;border:1px solid rgba(99,102,241,0.14);border-radius:16px;padding:22px 24px;grid-column:span 2;">
    <div style="display:flex;justify-content:space-between;align-items:flex-start;margin-bottom:14px;">
      <span style="font-size:11px;font-weight:500;letter-spacing:1px;text-transform:uppercase;color:#6366f1;">📊 GitHub Stats</span>
      <span style="font-family:ui-monospace,monospace;font-size:10px;padding:2px 8px;border-radius:4px;background:rgba(99,102,241,0.1);border:1px solid rgba(99,102,241,0.2);color:#818cf8;">live</span>
    </div>
    <div style="display:flex;flex-wrap:wrap;align-items:flex-start;gap:16px;">
      <img height="140em" src="https://github-readme-stats.vercel.app/api?username=Asakushen&show_icons=true&theme=transparent&include_all_commits=true&count_private=true&hide_border=true&bg_color=04040a&title_color=6366f1&text_color=94a3b8&icon_color=6366f1&disable_animations=true" style="border-radius:6px;"/>
      <img height="140em" src="https://github-readme-stats.vercel.app/api/top-langs/?username=Asakushen&layout=compact&theme=transparent&hide_border=true&bg_color=04040a&title_color=6366f1&text_color=64748b&custom_title=" style="border-radius:6px;"/>
      <img src="https://github-readme-streak-stats.herokuapp.com/?user=Asakushen&theme=transparent&hide_border=true&background=04040a&stroke=6366f1&ring=6366f1&fire=ef4444&currStreakLabel=6366f1&disable_animations=true" alt="streak" style="border-radius:6px;max-width:480px;width:100%;"/>
    </div>
    <!-- Contribution snake -->
    <div style="margin-top:16px;border-radius:6px;overflow:hidden;border:1px solid rgba(99,102,241,0.1);">
      <a href="https://github.com/Asakushen/Asakushen/actions">
        <img src="https://raw.githubusercontent.com/Asakushen/Asakushen/output/github-contribution-grid-snake.svg" alt="snake" style="width:100%;display:block;"/>
      </a>
    </div>
  </div>

  <!-- Card B: Metrics (WIDE) -->
  <div style="background:#04040a;border:1px solid rgba(99,102,241,0.14);border-radius:16px;padding:16px;grid-column:span 2;">
    <img src="github-metrics.svg" alt="metrics" style="width:100%;display:block;border-radius:6px;"/>
  </div>

  <!-- Card C: 3D Contributions -->
  <div style="background:#0a0912;border:1px solid rgba(99,102,241,0.14);border-radius:16px;padding:18px;display:flex;flex-direction:column;align-items:center;">
    <div style="font-size:10px;font-weight:500;letter-spacing:1px;text-transform:uppercase;color:#64748b;margin-bottom:12px;">🎨 Contrib</div>
    <img src="profile-3d-contrib/profile-green.svg" alt="3D" style="width:100%;display:block;border-radius:6px;"/>
  </div>

  <!-- Card D: Visual decoration -->
  <div style="background:#0a0912;border:1px solid rgba(99,102,241,0.14);border-radius:16px;padding:18px;display:flex;flex-direction:column;align-items:center;justify-content:center;">
    <div style="font-size:10px;font-weight:500;letter-spacing:1px;text-transform:uppercase;color:#64748b;margin-bottom:10px;">✦ Visual</div>
    <img src="assets-animated/fluid-divider.svg" style="width:100%;display:block;border-radius:4px;margin-bottom:10px;"/>
    <svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 260 160" style="width:100%;display:block;overflow:visible;">
      <defs>
        <radialGradient id="vb1" cx="50%" cy="50%" r="50%">
          <stop offset="0%" stop-color="#6366f1" stop-opacity="0.2">
            <animate attributeName="stop-color" values="#6366f1;#818cf8;#a78bfa;#6366f1" dur="8s" repeatCount="indefinite"/>
          </stop>
          <stop offset="100%" stop-color="#4f46e5" stop-opacity="0"/>
        </radialGradient>
        <filter id="vb2">
          <feGaussianBlur stdDeviation="14">
            <animate attributeName="stdDeviation" values="12;20;14;16;12" dur="5s" repeatCount="indefinite"/>
          </feGaussianBlur>
        </filter>
      </defs>
      <g filter="url(#vb2)">
        <path fill="url(#vb1)">
          <animate attributeName="d" dur="10s" repeatCount="indefinite" values="
            M120,15 C168,2 210,38 215,85 C220,132 188,168 148,178 C108,188 50,168 30,122 C10,78 42,22 82,14 C98,10 110,22 120,15 Z;
            M118,18 C170,4 215,42 218,88 C221,135 185,172 142,180 C100,188 48,172 28,125 C10,78 45,24 88,16 C104,12 112,24 118,18 Z;
            M120,15 C168,2 210,38 215,85 C220,132 188,168 148,178 C108,188 50,168 30,122 C10,78 42,22 82,14 C98,10 110,22 120,15 Z"/>
        </path>
      </g>
    </svg>
  </div>
</div>

---

<!-- ════════════════════════════════════════════════════════════
     03 TECH STACK
═══════════════════════════════════════════════════════════ -->

<div align="center" style="max-width:720px;margin:42px auto 0;padding:0;">
  <div style="display:flex;align-items:center;gap:10px;margin-bottom:14px;">
    <span style="font-family:ui-monospace,monospace;font-size:10px;letter-spacing:1.3px;color:#6366f1;text-transform:uppercase;">03 — stack</span>
    <div style="flex:1;height:1px;background:linear-gradient(90deg,rgba(99,102,241,0.22),transparent);"></div>
  </div>
  <div style="font-size:11px;font-weight:500;letter-spacing:.8px;text-transform:uppercase;color:#64748b;margin-bottom:10px;">Languages</div>
  <div style="display:flex;flex-wrap:wrap;justify-content:center;gap:8px;">
    <span style="display:inline-flex;align-items:center;padding:5px 12px;border-radius:9999px;background:rgba(16,185,129,0.1);border:1px solid rgba(16,185,129,0.18);color:#10b981;font-size:13px;">🐍 Python</span>
    <span style="display:inline-flex;align-items:center;padding:5px 12px;border-radius:9999px;background:rgba(99,102,241,0.1);border:1px solid rgba(99,102,241,0.18);color:#818cf8;font-size:13px;">⚡ C / C++</span>
    <span style="display:inline-flex;align-items:center;padding:5px 12px;border-radius:9999px;background:rgba(16,185,129,0.1);border:1px solid rgba(16,185,129,0.18);color:#10b981;font-size:13px;">📜 JavaScript</span>
    <span style="display:inline-flex;align-items:center;padding:5px 12px;border-radius:9999px;background:rgba(16,185,129,0.1);border:1px solid rgba(16,185,129,0.18);color:#10b981;font-size:13px;">🎨 HTML5 / CSS3</span>
    <span style="display:inline-flex;align-items:center;padding:5px 12px;border-radius:9999px;background:rgba(99,102,241,0.1);border:1px solid rgba(99,102,241,0.18);color:#818cf8;font-size:13px;">🟩 Django</span>
  </div>
  <div style="font-size:11px;font-weight:500;letter-spacing:.8px;text-transform:uppercase;color:#64748b;margin:14px 0 10px;">Tools & Platform</div>
  <div style="display:flex;flex-wrap:wrap;justify-content:center;gap:7px;">
    <span style="display:inline-flex;align-items:center;padding:5px 12px;border-radius:9999px;background:rgba(99,102,241,0.06);border:1px solid rgba(99,102,241,0.1);color:#64748b;font-size:12px;">Git / GitHub</span>
    <span style="display:inline-flex;align-items:center;padding:5px 12px;border-radius:9999px;background:rgba(99,102,241,0.06);border:1px solid rgba(99,102,241,0.1);color:#64748b;font-size:12px;">🐳 Docker</span>
    <span style="display:inline-flex;align-items:center;padding:5px 12px;border-radius:9999px;background:rgba(99,102,241,0.06);border:1px solid rgba(99,102,241,0.1);color:#64748b;font-size:12px;">☁️ Cloudflare</span>
    <span style="display:inline-flex;align-items:center;padding:5px 12px;border-radius:9999px;background:rgba(99,102,241,0.06);border:1px solid rgba(99,102,241,0.1);color:#64748b;font-size:12px;">▲ Vercel</span>
    <span style="display:inline-flex;align-items:center;padding:5px 12px;border-radius:9999px;background:rgba(99,102,241,0.06);border:1px solid rgba(99,102,241,0.1);color:#64748b;font-size:12px;">💻 VS Code</span>
    <span style="display:inline-flex;align-items:center;padding:5px 12px;border-radius:9999px;background:rgba(99,102,241,0.06);border:1px solid rgba(99,102,241,0.1);color:#64748b;font-size:12px;">🐧 Linux · Debian</span>
  </div>
</div>

---

<!-- ════════════════════════════════════════════════════════════
     04 PROJECTS — Selected work
═══════════════════════════════════════════════════════════ -->

<div align="center" style="max-width:720px;margin:42px auto 0;padding:0;">
  <div style="display:flex;align-items:center;gap:10px;margin-bottom:18px;">
    <span style="font-family:ui-monospace,monospace;font-size:10px;letter-spacing:1.3px;color:#6366f1;text-transform:uppercase;">04 — projects</span>
    <div style="flex:1;height:1px;background:linear-gradient(90deg,rgba(99,102,241,0.22),transparent);"></div>
  </div>
</div>

<div style="display:grid;grid-template-columns:1fr 1fr;gap:14px;max-width:720px;margin:0 auto;">

  <a href="https://www.chillg.de" style="text-decoration:none;color:inherit;">
  <div style="background:#04040a;border:1px solid rgba(99,102,241,0.14);border-radius:16px;padding:22px 24px;text-align:left;">
    <div style="display:flex;align-items:center;gap:12px;margin-bottom:12px;">
      <div style="width:36px;height:36px;border-radius:10px;background:linear-gradient(135deg,#6366f1,#818cf8);display:flex;align-items:center;justify-content:center;font-size:17px;flex-shrink:0;">🌐</div>
      <div>
        <div style="font-size:14px;font-weight:550;color:#f1f5f9;">个人博客</div>
        <div style="font-size:11px;color:#64748b;margin-top:1px;">chillg.de</div>
      </div>
    </div>
    <p style="font-size:13px;color:#8d94a6;line-height:1.55;margin:0 0 14px;">技术博客 · 编程学习心得 · 系统架构记录</p>
    <div style="display:flex;gap:6px;">
      <span style="padding:2px 9px;border-radius:5px;font-size:11px;background:rgba(99,102,241,0.1);border:1px solid rgba(99,102,241,0.18);color:#6366f1;">Blog</span>
      <span style="padding:2px 9px;border-radius:5px;font-size:11px;background:rgba(167,139,250,0.08);border:1px solid rgba(167,139,250,0.14);color:#a78bfa;">Tech</span>
    </div>
  </div>
  </a>

  <a href="https://github.com/Asakushen/Asakushen" style="text-decoration:none;color:inherit;">
  <div style="background:#04040a;border:1px solid rgba(99,102,241,0.14);border-radius:16px;padding:22px 24px;text-align:left;">
    <div style="display:flex;align-items:center;gap:12px;margin-bottom:12px;">
      <div style="width:36px;height:36px;border-radius:10px;background:linear-gradient(135deg,#10b981,#34d399);display:flex;align-items:center;justify-content:center;font-size:17px;flex-shrink:0;">🏠</div>
      <div>
        <div style="font-size:14px;font-weight:550;color:#f1f5f9;">GitHub Profile</div>
        <div style="font-size:11px;color:#64748b;margin-top:1px;">this repo · Asakushen/Asakushen</div>
      </div>
    </div>
    <p style="font-size:13px;color:#8d94a6;line-height:1.55;margin:0 0 14px;">自定义 SVG 动画 · 流体分割线 · 实时统计集成</p>
    <div style="display:flex;gap:6px;">
      <span style="padding:2px 9px;border-radius:5px;font-size:11px;background:rgba(16,185,129,0.1);border:1px solid rgba(16,185,129,0.18);color:#10b981;">SVG</span>
      <span style="padding:2px 9px;border-radius:5px;font-size:11px;background:rgba(99,102,241,0.1);border:1px solid rgba(99,102,241,0.18);color:#818cf8;">Animation</span>
    </div>
  </div>
  </a>

</div>

---

<!-- ════════════════════════════════════════════════════════════
     05 BLOB VISUALS — Generative decoration
═══════════════════════════════════════════════════════════ -->

<div align="center" style="max-width:720px;margin:42px auto 0;padding:0;">
  <div style="display:flex;align-items:center;gap:10px;margin-bottom:18px;">
    <span style="font-family:ui-monospace,monospace;font-size:10px;letter-spacing:1.3px;color:#6366f1;text-transform:uppercase;">05 — visual</span>
    <div style="flex:1;height:1px;background:linear-gradient(90deg,rgba(99,102,241,0.22),transparent);"></div>
  </div>
  <div style="background:#04040a;border:1px solid rgba(99,102,241,0.14);border-radius:16px;padding:20px;text-align:center;overflow:hidden;position:relative;">
    <div style="max-width:680px;margin:0 auto;">
      <svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 680 200" style="width:100%;height:auto;overflow:visible;">
        <defs>
          <radialGradient id="gbg" cx="50%" cy="50%" r="50%">
            <stop offset="0%" stop-color="#6366f1" stop-opacity="0.18">
              <animate attributeName="stop-color" values="#6366f1;#818cf8;#a78bfa;#10b981;#6366f1" dur="8s" repeatCount="indefinite"/>
            </stop>
            <stop offset="100%" stop-color="#4f46e5" stop-opacity="0"/>
          </radialGradient>
          <filter id="gbf">
            <feGaussianBlur stdDeviation="15">
              <animate attributeName="stdDeviation" values="13;21;15;17;13" dur="5s" repeatCount="indefinite"/>
            </feGaussianBlur>
          </filter>
        </defs>
        <g filter="url(#gbf)">
          <path fill="url(#gbg)">
            <animate attributeName="d" dur="11s" repeatCount="indefinite" values="
              M150,15 C200,0 255,38 262,88 C269,138 230,182 188,200 C146,218 75,195 48,148 C21,102 62,28 112,14 C130,8 140,22 150,15 Z;
              M148,18 C202,2 260,42 264,90 C268,138 228,184 184,202 C140,220 72,198 44,150 C18,102 60,30 115,16 C132,10 142,24 148,18 Z;
              M150,15 C200,0 255,38 262,88 C269,138 230,182 188,200 C146,218 75,195 48,148 C21,102 62,28 112,14 C130,8 140,22 150,15 Z"/>
          </path>
        </g>
        <g filter="url(#gbf)">
          <path fill="url(#gbg)">
            <animate attributeName="d" dur="15s" repeatCount="indefinite" values="
              M480,50 C528,28 578,65 585,112 C592,160 558,198 518,208 C478,218 408,195 382,148 C356,102 396,38 442,25 C460,20 470,36 480,50 Z;
              M478,52 C530,28 582,68 588,116 C594,162 558,202 516,210 C474,218 406,198 380,150 C354,102 394,40 445,27 C462,22 472,38 478,52 Z;
              M480,50 C528,28 578,65 585,112 C592,160 558,198 518,208 C478,218 408,195 382,148 C356,102 396,38 442,25 C460,20 470,36 480,50 Z"/>
          </path>
        </g>
      </svg>
    </div>
  </div>
</div>

---

<!-- ════════════════════════════════════════════════════════════
     06 3D CONTRIBUTION MAP
═══════════════════════════════════════════════════════════ -->

<div align="center" style="max-width:720px;margin:42px auto 0;padding:0;">
  <div style="display:flex;align-items:center;gap:10px;margin-bottom:18px;">
    <span style="font-family:ui-monospace,monospace;font-size:10px;letter-spacing:1.3px;color:#6366f1;text-transform:uppercase;">06 — contributions</span>
    <div style="flex:1;height:1px;background:linear-gradient(90deg,rgba(99,102,241,0.22),transparent);"></div>
  </div>
  <img src="profile-3d-contrib/profile-green-animate.svg" alt="3D contrib" style="width:100%;display:block;border-radius:16px;border:1px solid rgba(99,102,241,0.14);"/>
</div>

---

<!-- ════════════════════════════════════════════════════════════
     07 CONTACT
═══════════════════════════════════════════════════════════ -->

<div align="center" style="max-width:720px;margin:42px auto 0;padding:0;">
  <div style="display:flex;align-items:center;gap:10px;margin-bottom:18px;">
    <span style="font-family:ui-monospace,monospace;font-size:10px;letter-spacing:1.3px;color:#6366f1;text-transform:uppercase;">07 — contact</span>
    <div style="flex:1;height:1px;background:linear-gradient(90deg,rgba(99,102,241,0.22),transparent);"></div>
  </div>
  <div style="display:flex;flex-wrap:wrap;justify-content:center;gap:8px;margin-bottom:36px;">
    <a href="mailto:hi@chillg.de" style="display:inline-flex;align-items:center;padding:6px 14px;border-radius:9999px;background:rgba(99,102,241,0.08);border:1px solid rgba(99,102,241,0.14);color:#818cf8;text-decoration:none;font-size:13px;">✉️ hi@chillg.de</a>
    <a href="https://github.com/Asakushen" style="display:inline-flex;align-items:center;padding:6px 14px;border-radius:9999px;background:rgba(99,102,241,0.08);border:1px solid rgba(99,102,241,0.14);color:#64748b;text-decoration:none;font-size:13px;">💻 @Asakushen</a>
    <a href="https://www.chillg.de" style="display:inline-flex;align-items:center;padding:6px 14px;border-radius:9999px;background:rgba(99,102,241,0.08);border:1px solid rgba(99,102,241,0.14);color:#64748b;text-decoration:none;font-size:13px;">🌐 chillg.de</a>
  </div>

  <div style="width:40px;height:2px;border-radius:2px;background:linear-gradient(90deg,#6366f1,#818cf8,#a78bfa);margin:0 auto 18px;"></div>
  <div style="color:#475569;font-size:13px;line-height:1.65;text-align:center;">
    感谢来访 · 喜欢的话给个 ⭐ Star 吧<br/>
    <span style="color:#334155;font-size:12px;">Asakushen/Asakushen — Fork 自由使用</span>
  </div>
</div>

