/*
 * Author: Harrison
 * Zeus module function to set randomized injuries on a unit.
 *
 * Arguments:
 * 0: Logic <OBJECT>
 *
 * Return Value:
 * None
 *
 * Example:
 * [LOGIC] call harr_randomInjuries_fnc_setInjuries
 *
 * Public: No
 */
params ["_logic"];

private _object = effectiveCommander (curatorMouseOver select 1);
deleteVehicle _logic;

if (isNull _object || !(_object isKindOf "CAManBase") || !alive _object) exitWith {
    ["Place on a living unit"] call zen_common_fnc_showMessage;
};

["Set Randomized Injuries", [
		["COMBO", "Injury Severity",
			[
				["smallArmsMinor", "smallArmsMajor", "rocket", "artillery", "ied"],
				["Small Arms (Minor)", "Small Arms (Major)", "Rocket", "Artillery", "Mine/IED"]
			]
		]
	],
	{
		private _bodyParts = ["Head", "Body", "LeftArm", "RightArm", "LeftLeg", "RightLeg"];
		params ["_values", "_unit"];
    	_values params ["_severity"];

		switch (_severity) do
		{
			case "smallArmsMinor": 
			{
				private _numWounds = floor random [1, 1.5, 2]; 
				for "_i" from 0 to _numWounds do {
					private _target = _bodyParts deleteAt (floor random (count _bodyParts));
					private _damage = random [0.65, 0.75, 0.85];
					[_unit, _damage, _target, "bullet"] call ACE_medical_fnc_addDamageToUnit;
				};
			};
			case "smallArmsMajor":
			{
				private _numWounds = floor random [2, 2.5, 3]; 
				for "_i" from 0 to _numWounds do {
					private _target = _bodyParts deleteAt (floor random (count _bodyParts));
					private _damage = random [1.0, 1.25, 1.5];
					[_unit, _damage, _target, "bullet"] call ACE_medical_fnc_addDamageToUnit;
				};
			};
			case "rocket":
			{
				private _numWounds = floor random [3, 4, 5]; 
				for "_i" from 0 to _numWounds do {
					private _target = _bodyParts deleteAt (floor random (count _bodyParts));
					private _damage = random [5, 7.5, 10];
					[_unit, _damage, _target, "explosive"] call ACE_medical_fnc_addDamageToUnit;
				};
			};
			case "artillery":
			{
				private _numWounds = floor random [4, 5, 6]; 
				for "_i" from 0 to _numWounds do {
					private _target = _bodyParts deleteAt (floor random (count _bodyParts));
					private _damage = random [10, 12.5, 15];
					[_unit, _damage, _target, "explosive"] call ACE_medical_fnc_addDamageToUnit;
				};
			};
			case "ied":
			{
				private _numWounds = floor random [4, 5, 6]; 
				for "_i" from 0 to _numWounds do {
					private _target = _bodyParts deleteAt (floor random (count _bodyParts));
					private _damage = random [15, 17.5, 20];
					[_unit, _damage, _target, "explosive"] call ACE_medical_fnc_addDamageToUnit;
				};
			};
		};
	},
	{},
_object] call zen_dialog_fnc_create;
