waitUntil { time > 1 };
waitUntil { !isNil "FCLIB_all_fobs" };
waitUntil { !isNil "save_is_loaded" };

private [ "_fobbox" ];

if ( count FCLIB_all_fobs == 0 ) then {

	if ( FCLIB_build_first_fob ) then {
		_potentialplaces = [];
		{
			_nextsector = _x;
			_acceptsector = true;
			{
				if ( ( ( markerPos _nextsector ) distance ( markerPos _x ) ) < 1600 ) then {
					_acceptsector = false;
				};
			} foreach sectors_allSectors;

			if ( _acceptsector ) then {
				_potentialplaces pushBack _nextsector;
			};
		} foreach sectors_opfor;

		_spawnplace = _potentialplaces call BIS_fnc_selectRandom;
		[ [ markerPos _spawnplace, true ] , "build_fob_remote_call" ] call BIS_fnc_MP;

	} else {
		while { count FCLIB_all_fobs == 0 } do {

			if ( FCLIB_isAtlasPresent ) then {
				_fobbox = FOB_box_typename createVehicle [0,0,50];
				_fobbox enableSimulationGlobal false;
				_fobbox allowDamage false;
				_fobbox setposasl [(getpos lhd select 0) + 10, (getpos lhd select 1) + 62, (18.5   + (getposasl lhd select 2))];
				clearItemCargoGlobal _fobbox;
				_fobbox setDir 130;
				sleep 1;
				_fobbox enableSimulationGlobal true;
				_fobbox allowDamage true;
			} else {
				_fobbox = FOB_box_typename createVehicle (getpos base_boxspawn);
				_fobbox setpos (getpos base_boxspawn);
				_fobbox setdir 215;
			};

			[ [_fobbox, 3000 ] , "F_setMass" ] call BIS_fnc_MP;

			sleep 3;

			waitUntil {
				sleep 1;
				!(alive _fobbox) || count FCLIB_all_fobs > 0
			};

			sleep 15;

		};

		deleteVehicle _fobbox;
	};
};