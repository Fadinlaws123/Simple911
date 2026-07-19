<div align="center">

# 🚨 Simple911

### The original standalone 911 and 311 call resource from SimpleDevelopments.

<p>
  <a href="https://simpledevelopments.org/store"><img src="https://img.shields.io/badge/Explore_Our_Store-5865F2?style=for-the-badge&logo=googlechrome&logoColor=white" /></a>
  <a href="https://discord.gg/RquDVTfDwu"><img src="https://img.shields.io/badge/Join_Our_Discord-5865F2?style=for-the-badge&logo=discord&logoColor=white" /></a>
  <a href="https://github.com/Fadinlaws123/Simple911"><img src="https://img.shields.io/badge/View_on_GitHub-181717?style=for-the-badge&logo=github&logoColor=white" /></a>
</p>

<p>
  <img src="https://img.shields.io/badge/FiveM-Standalone-FF6B35?style=flat-square&logo=fivem&logoColor=white" />
  <img src="https://img.shields.io/badge/Status-Legacy-F59E0B?style=flat-square" />
  <img src="https://img.shields.io/badge/New_Version-Simple911_v2-5865F2?style=flat-square" />
  <img src="https://img.shields.io/github/stars/Fadinlaws123/Simple911?style=flat-square&logo=github&label=Stars" />
</p>

</div>

---

## 📖 About

**Simple911** is the original SimpleDevelopments emergency call resource, combining basic `/911` and `/311` commands into one standalone script.

This repository is kept available as the legacy version of the project. For the newer rebuilt system with interactive responder cards, call management, unit tracking, on-scene detection, Discord incident logs, and additional configuration, use **[Simple911 v2](https://github.com/Fadinlaws123/Simple911_v2)**.

---

## ✨ Features

- `/911` emergency calls for Police, Fire, and EMS
- `/311` non-emergency calls for services such as towing
- Standalone operation
- No framework dependency
- Separate call formatting for 911 and 311 requests

---

## 🎮 Commands

| Command | Description |
| --- | --- |
| `/911 <message>` | Sends an emergency call with the player's location. |
| `/311 <message>` | Sends a non-emergency service call. |

---

## 📥 Installation

1. Download the resource and place `Simple911` in your server's resources directory.
2. Add the following to your `server.cfg`:

```cfg
ensure Simple911
```

3. Restart the resource or server.

---

## ⚠️ Compatibility

Avoid running this resource alongside another script that already registers `/911` or `/311` commands. The original **SimpleCore** also includes overlapping emergency-call functionality, so running both systems together may cause conflicts.

---

## 🆕 Looking for the Current Version?

Simple911 has been completely rebuilt as **Simple911 v2**.

**Repository:** https://github.com/Fadinlaws123/Simple911_v2

---

## 🌐 SimpleDevelopments

Simple911 is maintained as a legacy SimpleDevelopments resource for users who still rely on the original system.

<div align="center">

### Keep it Simple. Keep it SimpleDevelopments.

</div>
