/*
    KPLIB_fnc_garrison_getVehSpawnPos

    File: fn_garrison_getVehSpawnPos.sqf
    Author: KP Liberation Dev Team - https://github.com/KillahPotatoes
    Date: 2018-10-23
    Last Update: 2018-10-24
    License: GNU General Public License v3.0 - https://www.gnu.org/licenses/gpl-3.0.html

    Description:
        Finds an position where a vehicle can safely spawn. Skips water positions.

    Parameter(s):
        _centerPos - Center position from which to find a spawn position [ARRAY, defaults to []]

    Returns:
        Position to spawn as 3d position [ARRAY]
*/

params [
    ["_center", [], [[]], [2,3]]
];

private _spawnPos = (_center getPos [50 + (random 250), random 360]) findEmptyPosition [0, 100, "B_T_VTOL_01_armed_F"];

// Avoid spawn position on water or empty position by findEmptyPosition
if (_spawnPos isEqualTo [] || {surfaceIsWater _spawnPos}) exitWith {_this call KPLIB_fnc_garrison_getVehSpawnPos};

_spawnPos
