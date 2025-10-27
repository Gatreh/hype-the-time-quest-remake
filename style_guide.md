## Code order
1. @tool
2. @icon
3. @static_unload
4. class_name
5. extends
6. ## main documentation comment

7. signals
8. enums
9. constants
10. static variables
11. @export variables
12. public variables
13. private variables
14. @onready variables

15. \_static_init()
16. static methods
17. overridden built-in virtual methods:
	1. \_init()
	2. \_enter_tree()
	3. \_exit_tree()
	4. \_ready()
	5. \_draw()
	6. \_get_configuration_warnings()
	7. \_gui_input()
	8. \_input
	9. \_unhandled_input
	10. \_process
	11. \_physics_process
18. overridden custom methods
19. public methods
20. private methods
21. getters
22. setters
23. subclasses

# Folders
Important note: This folder structure is not meant to be applied to an empty project, Start with the top-level folders and as the project grows you grow the structure according to this pattern.

res://
- addons/ # Gray
- assets/ # Yellow
	- 2d/
		- fonts/
		- icons/
		- sprites/
		- themes/
	- 3d/
	- animations/
	- audio/
		- ambient/
		- language/ # example, en-GB, fr-FR
			- dialogue/
		- music/
		- sfx/
	- particles/
	- shaders/
	- video/
- branding/
	- Ignore in game exports
- data/ # Green
	- config/
	- exports/
		- platform/ # example, windows, web, iOS
		- .gdignore
	- level_data/
	- resources/
	- save_data/
	- text/
		- language/ # example, en-GB, fr-FR
			- dialogue/
			- hint/
			- lore/
			- narratives/
			- quests/
- documentation/ # Teal
	- style_guide.md
- globals/ # Blue
	- events/
	- managers/
	- singletons/
	- states/
	- utilities/
- scenes/ # Purple
	- entities/
		- enemies/
		- items/
		- npc/
		- player/
		- weapons/
	- environment/
		- buildings/
		- flora/
		- levels/
		- objects/
	- particle_effects/
	- templates/
	- traits/
	- ui/
- scripts/ # Pink
	- entities/
		- enemies/
		- items/
		- npc/
		- player/
		- weapons/
	- environment/
		- buildings/
		- flora/
		- levels/
		- objects/
	- templates/
	- traits/
	- ui/
- tests/ # Red
	- unit/
		- <top_level_folder>/
			- <second_level_folder>/
	- integration/
		- <top_level_folder>/
			- <second_level_folder>/
- tools/ # Orange
- LICENSE.md
- README.md
