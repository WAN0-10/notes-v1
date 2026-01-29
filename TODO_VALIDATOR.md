# Validator Implementation Plan

## Files to Update:

### 1. todo_dialogue_box.dart

- [x] Wrap content in Form widget with GlobalKey<FormState>
- [x] Pass key to DialogueBox constructor

### 2. todo_list.dart

- [x] Add GlobalKey<FormState> for the form
- [x] Pass key to DialogueBox
- [x] Update saveNewTask() to validate before saving

### 3. journal_dialogue.dart

- [x] Wrap content in Form widget with GlobalKey<FormState>
- [x] Pass key to JournalDialogue constructor

### 4. journal.dart

- [x] Add GlobalKey<FormState> for the form
- [x] Pass key to JournalDialogue
- [x] Update saveNewEntry() to validate before saving

### 5. notes_dialogue_box.dart

- [x] Add validator to note name TextField
- [x] Wrap content in Form widget with GlobalKey<FormState>
- [x] Add onSave validation check

### 6. notes.dart (if needed)

- [x] Add GlobalKey<FormState> for the form
- [x] Pass key to NotesBox
- [x] Update save/create function to validate before saving

---

## ✅ All tasks completed!

- Todo List: Empty textfields now prevented by validation
- Journal: Empty textfields now prevented by validation
- Notes: Empty note names now prevented by validation
