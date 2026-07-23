---
title: "Codex Sandbox Contract — Tier T3 (repo độc lập)"
status: active
date: 2026-07-23
---

# Codex Sandbox — T3 (Daniel ratify 2026-07-23)

Repo này là **sandbox T3** theo ADR-1169-AM008: Codex được **tự triển khai** (autonomous),
KHÔNG cần invoke Claude Code review trong vòng lặp thực thi.

## Branching

- `main` — protected. KHÔNG commit trực tiếp, KHÔNG force-push.
- `codex/work/{slug}` — Codex tự tạo, tự commit, tự push. Tự do iterate.
- Commit message: mô tả thật việc đã làm + marker `[codex-YYYYMMDD]`.

## Review gate — DUY NHẤT tại merge → main

- Merge `codex/work/*` → `main` CHỈ sau khi Claude Code review
  (`/claire-master:auto-reviewer --mode codex`) hoặc Daniel duyệt trực tiếp.
- Codex KHÔNG tự merge về main. Xong việc → dừng ở branch + báo kết quả.

## Safety floor (không miễn)

- KHÔNG secret/credential/PII trong code hoặc commit (ADR-0905).
- KHÔNG dữ liệu F88/org trong repo này (ADR-0904).
- Honesty: chỉ tuyên "done/pushed" sau khi verify bằng git thật — không narrate intent.
