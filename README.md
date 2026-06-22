<div align="center">
  <!-- Animated particle field background -->
  <div style="position:relative;max-width:900px;margin:0 auto;overflow:hidden;border-radius:24px;background:linear-gradient(135deg,rgba(94,106,210,0.08),rgba(113,112,255,0.05),rgba(167,139,250,0.06));padding:60px 40px 50px;">
    <!-- Morphing blob decoration -->
    <div style="position:absolute;top:-50px;right:-40px;opacity:0.5;pointer-events:none;">
      <img src="assets-animated/morph-blob.svg" width="240" alt=""/>
    </div>
    <div style="position:absolute;bottom:-30px;left:-30px;opacity:0.35;pointer-events:none;">
      <img src="assets-animated/morph-blob.svg" width="180" alt=""/>
    </div>
    <!-- Particle field -->
    <div style="position:absolute;top:0;left:0;width:100%;height:100%;opacity:0.5;pointer-events:none;">
      <img src="assets-animated/particle-field.svg" style="width:100%;height:100%;object-fit:cover;" alt=""/>
    </div>

    <div style="position:relative;z-index:1;">
      <!-- Avatar with spring entrance -->
      <div style="animation:springIn 0.9s cubic-bezier(0.34,1.56,0.64,1) 0.1s both;">
        <img src="src/header_.png" alt="avatar" style="border-radius:24px;box-shadow:0 8px 32px rgba(94,106,210,0.2),0 0 0 1px rgba(255,255,255,0.08);width:130px;height:130px;object-fit:cover;"/>
      </div>

      <!-- Gradient animated name -->
      <h1 style="animation:springIn 0.9s cubic-bezier(0.34,1.56,0.64,1) 0.25s both;margin-top:24px;font-size:42px;font-weight:500;line-height:1.1;letter-spacing:-0.8px;background:linear-gradient(135deg,#f7f8f8 0%,#7170ff 25%,#a78bfa 50%,#10b981 75%,#f7f8f8 100%);background-size:300% 300%;-webkit-background-clip:text;background-clip:text;color:transparent;animation:springIn 0.9s cubic-bezier(0.34,1.56,0.64,1) 0.25s both,gradTextShift 6s ease-in-out infinite;">
        Asakushen
      </h1>

      <!-- Subtitle with typing-like fade -->
      <p style="animation:springIn 0.9s cubic-bezier(0.34,1.56,0.64,1) 0.4s both;color:#8a8f98;font-size:17px;margin-top:12px;font-weight:400;line-height:1.5;max-width:500px;margin-left:auto;margin-right:auto;">
        Full-Stack Developer · Open Source Enthusiast · <span style="color:#7170ff;">Building the future, one commit at a time</span>
      </p>

      <!-- Status badges -->
      <div style="animation:springIn 0.9s cubic-bezier(0.34,1.56,0.64,1) 0.55s both;display:flex;flex-wrap:wrap;justify-content:center;gap:8px;margin-top:20px;">
        <a href="https://github.com/Asakushen" style="display:inline-flex;align-items:center;padding:6px 14px;border-radius:9999px;background:rgba(255,255,255,0.04);border:1px solid rgba(255,255,255,0.08);color:#d0d6e0;text-decoration:none;font-size:13px;font-weight:500;transition:all 0.3s cubic-bezier(0.34,1.56,0.64,1);">
          <span style="display:inline-block;width:8px;height:8px;border-radius:50%;background:#10b981;margin-right:6px;box-shadow:0 0 8px rgba(16,185,129,0.5);"></span>
          Open to collaborate
        </a>
        <a href="https://www.chillg.de" style="display:inline-flex;align-items:center;padding:6px 14px;border-radius:9999px;background:rgba(255,255,255,0.04);border:1px solid rgba(255,255,255,0.08);color:#d0d6e0;text-decoration:none;font-size:13px;font-weight:500;transition:all 0.3s cubic-bezier(0.34,1.56,0.64,1);">
          🌐 www.chillg.de
        </a>
      </div>

      <!-- Fluid wave divider -->
      <div style="margin-top:40px;border-radius:16px;overflow:hidden;">
        <img src="assets-animated/fluid-wave-top.svg" style="width:100%;height:auto;display:block;" alt=""/>
      </div>
    </div>
  </div>
</div>

<style>
  /* Fluid animation keyframes */
  @keyframes springIn {
    0% { opacity: 0; transform: translateY(30px) scale(0.95); }
    60% { opacity: 1; transform: translateY(-4px) scale(1.01); }
    80% { transform: translateY(2px) scale(0.99); }
    100% { opacity: 1; transform: translateY(0) scale(1); }
  }
  @keyframes gradTextShift {
    0%, 100% { background-position: 0% 50%; }
    25% { background-position: 100% 50%; }
    50% { background-position: 100% 0%; }
    75% { background-position: 0% 100%; }
  }
  @keyframes float {
    0%, 100% { transform: translateY(0) rotate(0deg); }
    25% { transform: translateY(-8px) rotate(1deg); }
    50% { transform: translateY(-4px) rotate(0deg); }
    75% { transform: translateY(-10px) rotate(-1deg); }
  }
  @keyframes cardHover {
    0%, 100% { transform: translateY(0); }
    50% { transform: translateY(-3px); }
  }
  @keyframes pulseGlow {
    0%, 100% { box-shadow: 0 0 20px rgba(94,106,210,0.1); }
    50% { box-shadow: 0 0 35px rgba(94,106,210,0.25), 0 0 60px rgba(113,112,255,0.1); }
  }
  @keyframes shine {
    0% { background-position: -200% center; }
    100% { background-position: 200% center; }
  }
  @keyframes revealLine {
    from { width: 0; }
    to { width: 100%; }
  }

  /* Card hover effect */
  .fluid-card {
    transition: all 0.4s cubic-bezier(0.34,1.56,0.64,1) !important;
    animation: pulseGlow 5s ease-in-out infinite;
  }
  .fluid-card:hover {
    transform: translateY(-6px) scale(1.02) !important;
    box-shadow: 0 12px 40px rgba(94,106,210,0.3), 0 0 0 1px rgba(113,112,255,0.2) !important;
    background: rgba(255,255,255,0.05) !important;
  }

  /* Badge float */
  .fluid-badge {
    transition: all 0.35s cubic-bezier(0.34,1.56,0.64,1) !important;
    animation: float 6s ease-in-out infinite;
  }
  .fluid-badge:hover {
    transform: translateY(-5px) scale(1.08) !important;
    box-shadow: 0 6px 20px rgba(94,106,210,0.3) !important;
    border-color: rgba(113,112,255,0.3) !important;
  }

  /* Section reveal */
  .reveal-section {
    animation: springIn 0.8s cubic-bezier(0.34,1.56,0.64,1) both;
  }
  .reveal-section:nth-child(1) { animation-delay: 0.1s; }
  .reveal-section:nth-child(2) { animation-delay: 0.2s; }
  .reveal-section:nth-child(3) { animation-delay: 0.3s; }

  /* Skill bar animation */
  .skill-fill {
    animation: revealLine 1.5s cubic-bezier(0.34,1.56,0.64,1) both;
  }

  /* Link hover */
  a:hover {
    text-decoration: none !important;
  }

  /* Stat number shimmer */
  .shimmer-text {
    background: linear-gradient(90deg, currentColor 0%, currentColor 40%, rgba(255,255,255,0.4) 50%, currentColor 60%, currentColor 100%);
    background-size: 200% 100%;
    -webkit-background-clip: text;
    -webkit-text-fill-color: transparent;
    background-clip: text;
    animation: shine 3s ease-in-out infinite;
  }
</style>

---

## 📈 技能数据

<div align="center" style="animation:springIn 0.8s cubic-bezier(0.34,1.56,0.64,1) 0.7s both;margin-top:40px;margin-bottom:10px;">
  <img src="assets-animated/animated-skills.svg" style="width:100%;max-width:560px;" alt="animated skills"/>
</div>

![Animated Stats](assets-animated/fluid-stats.svg)

---

## 🛠️ 技术栈

<div align="center" style="animation:springIn 0.8s cubic-bezier(0.34,1.56,0.64,1) 0.8s both;">

### 核心语言
<div style="display:flex;flex-wrap:wrap;justify-content:center;gap:10px;margin:20px 0;">

<a href="#" class="fluid-badge" style="display:inline-flex;align-items:center;padding:8px 16px;border-radius:8px;background:rgba(255,255,255,0.03);border:1px solid rgba(255,255,255,0.08);color:#d0d6e0;text-decoration:none;font-size:14px;font-weight:500;font-family:system-ui,sans-serif;">
  🐍 Python
</a>

<a href="#" class="fluid-badge" style="display:inline-flex;align-items:center;padding:8px 16px;border-radius:8px;background:rgba(255,255,255,0.03);border:1px solid rgba(255,255,255,0.08);color:#d0d6e0;text-decoration:none;font-size:14px;font-weight:500;font-family:system-ui,sans-serif;animation-delay:-1s;">
  ⚡ C/C++
</a>

<a href="#" class="fluid-badge" style="display:inline-flex;align-items:center;padding:8px 16px;border-radius:8px;background:rgba(255,255,255,0.03);border:1px solid rgba(255,255,255,0.08);color:#d0d6e0;text-decoration:none;font-size:14px;font-weight:500;font-family:system-ui,sans-serif;animation-delay:-2s;">
  🟨 JavaScript
</a>

<a href="#" class="fluid-badge" style="display:inline-flex;align-items:center;padding:8px 16px;border-radius:8px;background:rgba(255,255,255,0.03);border:1px solid rgba(255,255,255,0.08);color:#d0d6e0;text-decoration:none;font-size:14px;font-weight:500;font-family:system-ui,sans-serif;animation-delay:-3s;">
  🟥 HTML5/CSS3
</a>

<a href="#" class="fluid-badge" style="display:inline-flex;align-items:center;padding:8px 16px;border-radius:8px;background:rgba(255,255,255,0.03);border:1px solid rgba(255,255,255,0.08);color:#d0d6e0;text-decoration:none;font-size:14px;font-weight:500;font-family:system-ui,sans-serif;animation-delay:-4s;">
  🟩 Django
</a>

</div>

### 工具 & 平台
<div style="display:flex;flex-wrap:wrap;justify-content:center;gap:10px;margin:20px 0;">

<a href="#" class="fluid-badge" style="display:inline-flex;align-items:center;padding:8px 16px;border-radius:8px;background:rgba(255,255,255,0.03);border:1px solid rgba(255,255,255,0.08);color:#8a8f98;text-decoration:none;font-size:13px;font-family:system-ui,sans-serif;animation-delay:-5s;">
  Git / GitHub
</a>

<a href="#" class="fluid-badge" style="display:inline-flex;align-items:center;padding:8px 16px;border-radius:8px;background:rgba(255,255,255,0.03);border:1px solid rgba(255,255,255,0.08);color:#8a8f98;text-decoration:none;font-size:13px;font-family:system-ui,sans-serif;animation-delay:-6s;">
  Docker
</a>

<a href="#" class="fluid-badge" style="display:inline-flex;align-items:center;padding:8px 16px;border-radius:8px;background:rgba(255,255,255,0.03);border:1px solid rgba(255,255,255,0.08);color:#8a8f98;text-decoration:none;font-size:13px;font-family:system-ui,sans-serif;animation-delay:-7s;">
  Cloudflare
</a>

<a href="#" class="fluid-badge" style="display:inline-flex;align-items:center;padding:8px 16px;border-radius:8px;background:rgba(255,255,255,0.03);border:1px solid rgba(255,255,255,0.08);color:#8a8f98;text-decoration:none;font-size:13px;font-family:system-ui,sans-serif;animation-delay:-8s;">
  Vercel
</a>

<a href="#" class="fluid-badge" style="display:inline-flex;align-items:center;padding:8px 16px;border-radius:8px;background:rgba(255,255,255,0.03);border:1px solid rgba(255,255,255,0.08);color:#8a8f98;text-decoration:none;font-size:13px;font-family:system-ui,sans-serif;animation-delay:-9s;">
  VS Code
</a>

<a href="#" class="fluid-badge" style="display:inline-flex;align-items:center;padding:8px 16px;border-radius:8px;background:rgba(255,255,255,0.03);border:1px solid rgba(255,255,255,0.08);color:#8a8f98;text-decoration:none;font-size:13px;font-family:system-ui,sans-serif;animation-delay:-10s;">
  Linux · Debian
</a>

</div>

</div>

---

## 📊 数据概览

<div align="center" style="animation:springIn 0.8s cubic-bezier(0.34,1.56,0.64,1) 1.0s both;">

### 贡献热力图
<a href="https://github.com/Asakushen/Asakushen/actions">
  <img src="https://raw.githubusercontent.com/Asakushen/Asakushen/output/github-contribution-grid-snake.svg" alt="snake animation" style="border-radius:12px;border:1px solid rgba(255,255,255,0.08);"/>
</a>

### 统计数据
<div style="display:flex;justify-content:center;flex-wrap:wrap;gap:16px;margin:24px 0;">

<img height="160em" src="https://github-readme-stats.vercel.app/api?username=Asakushen&show_icons=true&theme=tokyonight&include_all_commits=true&count_private=true&hide_border=true&bg_color=0d1117&title_color=7170ff&text_color=d0d6e0&icon_color=7170ff" style="border-radius:12px;" />

<img height="160em" src="https://github-readme-stats.vercel.app/api/top-langs/?username=Asakushen&layout=compact&theme=tokyonight&hide_border=true&bg_color=0d1117&title_color=7170ff&text_color=d0d6e0" style="border-radius:12px;" />

</div>

### 连续贡献
<img src="https://github-readme-streak-stats.herokuapp.com/?user=Asakushen&theme=tokyonight&hide_border=true&background=0d1117&stroke=7170ff&ring=7170ff&fire=ff6b6b&currStreakLabel=7170ff" alt="streak" style="border-radius:12px;" />

### Metrics
<img src="github-metrics.svg" alt="metrics" style="border-radius:12px;" />

</div>

---

## 🎨 3D 贡献图

<div align="center" style="animation:springIn 0.8s cubic-bezier(0.34,1.56,0.64,1) 1.1s both;">
  <img src="profile-3d-contrib/profile-green-animate.svg" alt="3D contrib" style="max-width:100%;border-radius:16px;border:1px solid rgba(255,255,255,0.06);"/>
</div>

---

## 🎯 项目展示

<div align="center">

<div style="animation:springIn 0.8s cubic-bezier(0.34,1.56,0.64,1) 1.2s both;display:grid;grid-template-columns:repeat(auto-fit,minmax(280px,1fr));gap:20px;max-width:900px;margin:20px auto;text-align:left;">

<!-- Project Card 1 -->
<a href="https://www.chillg.de" style="text-decoration:none;color:inherit;">
  <div class="fluid-card" style="padding:24px;border-radius:16px;background:rgba(255,255,255,0.03);border:1px solid rgba(255,255,255,0.08);cursor:pointer;text-decoration:none;">
    <div style="display:flex;align-items:center;gap:12px;margin-bottom:14px;">
      <div style="width:40px;height:40px;border-radius:10px;background:linear-gradient(135deg,#5e6ad2,#7170ff);display:flex;align-items:center;justify-content:center;font-size:20px;">🌐</div>
      <h3 style="margin:0;font-size:17px;font-weight:500;color:#f7f8f8;font-family:system-ui,sans-serif;">个人博客</h3>
    </div>
    <p style="margin:0;color:#8a8f98;font-size:14px;line-height:1.6;font-family:system-ui,sans-serif;">
      技术博客 · 编程学习心得 · 系统架构记录
    </p>
    <div style="margin-top:14px;display:flex;gap:8px;">
      <span style="padding:3px 10px;border-radius:6px;font-size:11px;font-family:system-ui,sans-serif;background:rgba(94,106,210,0.15);color:#7170ff;border:1px solid rgba(94,106,210,0.2);">Blog</span>
      <span style="padding:3px 10px;border-radius:6px;font-size:11px;font-family:system-ui,sans-serif;background:rgba(167,139,250,0.1);color:#a78bfa;border:1px solid rgba(167,139,250,0.15);">Tech</span>
    </div>
  </div>
</a>

<!-- Project Card 2 -->
<a href="https://github.com/Asakushen/Asakushen" style="text-decoration:none;color:inherit;">
  <div class="fluid-card" style="padding:24px;border-radius:16px;background:rgba(255,255,255,0.03);border:1px solid rgba(255,255,255,0.08);cursor:pointer;text-decoration:none;animation-delay:-2s;">
    <div style="display:flex;align-items:center;gap:12px;margin-bottom:14px;">
      <div style="width:40px;height:40px;border-radius:10px;background:linear-gradient(135deg,#10b981,#34d399);display:flex;align-items:center;justify-content:center;font-size:20px;">🏠</div>
      <h3 style="margin:0;font-size:17px;font-weight:500;color:#f7f8f8;font-family:system-ui,sans-serif;">GitHub Profile</h3>
    </div>
    <p style="margin:0;color:#8a8f98;font-size:14px;line-height:1.6;font-family:system-ui,sans-serif;">
      动态个人主页 · 流体动画 · 实时统计
    </p>
    <div style="margin-top:14px;display:flex;gap:8px;">
      <span style="padding:3px 10px;border-radius:6px;font-size:11px;font-family:system-ui,sans-serif;background:rgba(16,185,129,0.15);color:#10b981;border:1px solid rgba(16,185,129,0.2);">SVG</span>
      <span style="padding:3px 10px;border-radius:6px;font-size:11px;font-family:system-ui,sans-serif;background:rgba(94,106,210,0.1);color:#7170ff;border:1px solid rgba(94,106,210,0.15);">Animation</span>
    </div>
  </div>
</a>

</div>

</div>

---

## 💬 精选语录

<div align="center" style="animation:springIn 0.8s cubic-bezier(0.34,1.56,0.64,1) 1.3s both;margin:40px 0;padding:0 20px;">
  <div style="max-width:600px;margin:0 auto;padding:28px 32px;border-radius:16px;background:rgba(255,255,255,0.03);border:1px solid rgba(255,255,255,0.08);position:relative;">
    <div style="position:absolute;top:-12px;left:50%;transform:translateX(-50%);font-size:32px;color:#7170ff;opacity:0.4;">❝</div>
    <p style="margin:0;color:#c0c7d2;font-size:15px;line-height:1.7;font-family:system-ui,sans-serif;font-style:italic;">
      Code is poetry written for machines to execute and humans to admire.
    </p>
    <div style="margin-top:16px;height:2px;border-radius:1px;background:linear-gradient(90deg,transparent,#7170ff,transparent);animation:revealLine 2s cubic-bezier(0.34,1.56,0.64,1) 1.5s both;width:60%;margin-left:auto;margin-right:auto;"></div>
  </div>
</div>

---

## 📞 联系方式

<div align="center" style="animation:springIn 0.8s cubic-bezier(0.34,1.56,0.64,1) 1.4s both;">

<div style="display:flex;justify-content:center;gap:16px;flex-wrap:wrap;margin:20px 0;">

<a href="mailto:hi@chillg.de" class="fluid-badge" style="display:inline-flex;align-items:center;padding:10px 20px;border-radius:10px;background:rgba(255,255,255,0.04);border:1px solid rgba(255,255,255,0.1);color:#d0d6e0;text-decoration:none;font-size:14px;font-family:system-ui,sans-serif;animation-delay:-1s;">
  ✉️ hi@chillg.de
</a>

<a href="https://github.com/Asakushen" class="fluid-badge" style="display:inline-flex;align-items:center;padding:10px 20px;border-radius:10px;background:rgba(255,255,255,0.04);border:1px solid rgba(255,255,255,0.1);color:#d0d6e0;text-decoration:none;font-size:14px;font-family:system-ui,sans-serif;animation-delay:-2s;">
  💻 GitHub
</a>

<a href="https://www.chillg.de" class="fluid-badge" style="display:inline-flex;align-items:center;padding:10px 20px;border-radius:10px;background:rgba(255,255,255,0.04);border:1px solid rgba(255,255,255,0.1);color:#d0d6e0;text-decoration:none;font-size:14px;font-family:system-ui,sans-serif;animation-delay:-3s;">
  🌐 Blog
</a>

</div>

<p style="color:#62666d;font-size:14px;font-family:system-ui,sans-serif;line-height:1.6;">
  有问题或合作意向？欢迎邮件联系<br/>
  <span style="color:#8a8f98;">或者直接在我的任何仓库提交 PR / Issue</span>
</p>

</div>

---

<div align="center">

<div style="margin:40px 0 20px;border-radius:16px;overflow:hidden;">
  <img src="assets-animated/fluid-wave-bottom.svg" style="width:100%;height:auto;display:block;" alt=""/>
</div>

<div style="padding:20px 40px;border-radius:16px;background:rgba(255,255,255,0.02);border:1px solid rgba(255,255,255,0.06);animation:springIn 0.8s cubic-bezier(0.34,1.56,0.64,1) 1.5s both;">

### 💝 感谢访问

<p style="color:#62666d;font-size:13px;line-height:1.6;font-family:system-ui,sans-serif;margin:12px 0;">
  如果喜欢这个主页，可以给仓库点个 ⭐ Star<br/>
  模板在 <a href="https://github.com/Asakushen/Asakushen" style="color:#7170ff;text-decoration:none;">Asakushen/Asakushen</a> · Fork 后自由使用
</p>

<div style="margin:20px 0;display:flex;justify-content:center;">
  <div style="width:60px;height:3px;border-radius:2px;background:linear-gradient(90deg,#5e6ad2,#7170ff,#a78bfa,#10b981);"></div>
</div>

<p style="color:#62666d;font-size:11px;font-family:system-ui,sans-serif;margin:0;">
</p>
</div>
</div>
