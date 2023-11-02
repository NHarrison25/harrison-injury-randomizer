class CfgPatches
{
	class harr_randomInjuries
	{
		author = "Harrison";
		requiredAddons[] = {"ace_medical", "zen_dialog"};
		units[] = {"harr_randomInjuries_setInjured"};
	};
};
class CfgFunctions
{
	class harr_randomInjuries
	{
		class functions
		{
			file = "harr_randomInjuries\functions";
			class setInjuries {};
		};
	};
};
class CfgVehicles
{
	class ace_zeus_moduleUnconscious;
	class harr_randomInjuries_setInjured: ace_zeus_moduleUnconscious
	{
		author = "Harrison";
		displayName = "Set Random Injuries";
		function = "harr_randomInjuries_fnc_setInjuries";
	};
};
