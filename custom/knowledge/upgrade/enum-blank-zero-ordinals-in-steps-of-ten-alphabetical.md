---
bc-version: [all]
domain: upgrade
keywords: [enum, ordinal, value, steps-of-ten, alphabetical, blank-value, insert, breaking-change]
technologies: [al]
countries: [w1]
application-area: [all]
---

# Start an enum with a blank 0 value and number the rest alphabetically in steps of 10

## Description

Our house convention for AL `enum` objects keeps every enum predictable and leaves room to grow. Each enum starts with a blank value at ordinal 0, so a new record defaults to "nothing chosen" instead of a real choice. The other values follow in English alphabetical order at ordinals 10, 20, 30, and so on. The order of declaration is the order users see in the dropdown, so an alphabetical list is easy to scan.

The gaps of 10 are there so a value added later can go in at its alphabetical position with an unused ordinal between its neighbours, for example 15 between 10 and 20. Ordinals are stored in the database, so an existing ordinal never changes. Only the position of the new declaration does.

This convention replaces the "add new values only at the end" guidance in `microsoft/knowledge/upgrade/enum-values-additive-at-end.md` for our code. Adding a value in the middle of the declaration list is fine here, provided its ordinal is new and no existing ordinal changes.

## Best Practice

When creating a new `enum`:

- Declare `value(0; " ") { Caption = ' '; }` first.
- Declare the other values sorted A to Z by their English value name, with ordinals 10, 20, 30, and so on.

When adding a value to an existing `enum`:

- Declare the new value at its alphabetical position, with an unused ordinal between the ordinals of its neighbours (for example 15 between 10 and 20). Do not put it at the end just because it is new.
- Never renumber or reorder the ordinals of existing values.
- If there is no free ordinal between the neighbours, put the value at the end with the next free multiple of 10.
- To retire a value, keep it and mark it `ObsoleteState = Pending` (later `Removed`) with `ObsoleteReason` and `ObsoleteTag`, so its ordinal stays taken.

This convention covers `enum` objects. It does not cover `enumextension` values, which use ordinals from the app's ID range.

Report a violation as a `minor` finding that proposes the corrected declaration.

See sample: [`enum-blank-zero-ordinals-in-steps-of-ten-alphabetical.good.al`](enum-blank-zero-ordinals-in-steps-of-ten-alphabetical.good.al).

## Anti Pattern

- A new enum without a blank value at ordinal 0.
- A new enum numbered 1, 2, 3 (or 0, 1, 2) instead of in steps of 10, which leaves no room to insert values later.
- A new enum whose values are not declared in English alphabetical order.
- A value added later that is put at the end even though a free ordinal exists at its alphabetical position.
- Renumbering existing values to make room for a new one, or deleting a value instead of obsoleting it. Every stored row whose ordinal shifts silently reads as a different value.

See sample: [`enum-blank-zero-ordinals-in-steps-of-ten-alphabetical.bad.al`](enum-blank-zero-ordinals-in-steps-of-ten-alphabetical.bad.al).

## See also

- `microsoft/knowledge/upgrade/enum-values-additive-at-end.md`, the Microsoft guidance this convention replaces for value placement.
- `microsoft/knowledge/upgrade/obsoletion-requires-reason-and-tag.md`, for retiring a value.
