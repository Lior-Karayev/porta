# Code Concepts Index

A study aid: where each programming concept is **actually used** in Porta's code, and why. It helps every contributor explain the code they wrote and the features they took part in.

**Rules** (`AGENTS.md`, Section 8)

- Add an entry when a concept first appears in merged code, or when a new use shows something different.
- The file path and the class or method must exist. **Never invent code examples or locations.** When code moves, update the entry.
- Do not add abstractions to the code only so that a concept appears here.
- This index supports learning; it does not replace understanding the code.

## Entry template

```markdown
### <Concept name>

| Field | Value |
|---|---|
| File | `lib/…/file.dart` (line or range, optional) |
| Class / method | `ClassName.methodName` |
| Explanation | What the concept is, in two sentences |
| Why it is used here | … |
| How it works in Porta | … (data flow, what calls what) |
| Possible exam question | … |
```

## Concepts to watch for

Placeholders, not entries. Fill them in only when real code uses them.

| Concept | Likely first appearance (planned, not yet written) | Entry |
|---|---|---|
| `async` / `await` and `Future` | API calls from the app (Sprint 1) | — |
| Abstract classes and interfaces | Repository / service interfaces between UI and backend, if the team uses them | — |
| Inheritance and polymorphism | Permission types (one-time vs recurring), if modelled as subclasses | — |
| Dependency injection | Passing services to widgets or state objects, if used | — |
| Flutter widgets (stateless / stateful) | First screens (Sprint 1) | — |
| State management | Permission list and form state (Sprint 1–2) | — |
| Database operations | Permission and event storage (Sprint 1) | — |
| HTTP requests | Guest page → gate-open endpoint (Sprint 1) | — |
| Error handling | Offline and denial handling (Sprint 1–2) | — |
| Transactions and atomic updates | Gate-open validation and counter (Sprint 1–2) | — |
| Testing and mocking | First unit and backend tests (Sprint 1) | — |

## Entries

*No application code exists yet (CP0). The first entries are expected in Sprint 1.*
