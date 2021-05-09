/*
===========================================================================

  Copyright (c) 2010-2015 Darkstar Dev Teams

  This program is free software: you can redistribute it and/or modify
  it under the terms of the GNU General Public License as published by
  the Free Software Foundation, either version 3 of the License, or
  (at your option) any later version.

  This program is distributed in the hope that it will be useful,
  but WITHOUT ANY WARRANTY; without even the implied warranty of
  MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
  GNU General Public License for more details.

  You should have received a copy of the GNU General Public License
  along with this program.  If not, see http://www.gnu.org/licenses/

===========================================================================
*/

#include "../../common/socket.h"

#include "currency2.h"

#include "../entities/charentity.h"

CCurrencyPacket2::CCurrencyPacket2(CCharEntity* PChar)
{
	this->id(0x118);
	this->length(132);

    const char* query = "SELECT bayld, imprimaturs, kinetic_unit, obsidian_fragment, lebondopt_wing, \
                         pulchridopt_wing, mellidopt_wing, ghastly_stone, ghastly_stone1, ghastly_stone2, \
						 verdigris_stone, verdigris_stone1, verdigris_stone2, \
						 wailing_stone, wailing_stone1, wailing_stone2, \
						 snowslit_stone, snowslit_stone1, snowslit_stone2, \
						 snowtip_stone, snowtip_stone1, snowtip_stone2, \
						 snowdim_stone, snowdim_stone1, snowdim_stone2, \
						 snoworb_stone, snoworb_stone1, snoworb_stone2, \
						 leafslit_stone, leafslit_stone1, leafslit_stone2, \
						 leaftip_stone, leaftip_stone1, leaftip_stone, \
						 leafdim_stone, leafdim_stone1, leafdim_stone2, \
						 leaforb_stone, leaforb_stone1, leaforb_stone2, \
						 duskslit_stone, duskslit_stone1, duskslit_stone2, \
						 dusktip_stone, dusktip_stone1, dusktip_stone2, \
						 duskdim_stone, duskdim_stone1, duskdim_stone2, \
						 duskorb_stone, duskorb_stone1, duskorb_stone2, \
						 mweya_plasm, escha_silt, escha_bead, pellucid_stone, \
						 fern_stone, taupe_stone, potpourri, crafter_point, \
						 fire_focus, ice_focus, wind_focus, earth_focus, lightning_focus, \
						 water_focus, light_focus, dark_focus, mcisr01, mcisr02, mcisr03, \
						 liquefaction_sphere, induration_sphere, detonation_sphere, scission_sphere, \
						 impaction_sphere, reverbration_sphere, transfixion_sphere, compression_sphere, \
						 fusion_sphere, distortion_sphere, fragmentation_sphere, gravitation_sphere, \
						 light_sphere, dark_sphere, current_hallmark, total_hallmark, gallantry, silver_aman, \
						 canteen \
						 FROM char_points WHERE charid = %d";

    int ret = Sql_Query(SqlHandle, query, PChar->id);
    if (ret != SQL_ERROR && Sql_NextRow(SqlHandle) == SQL_SUCCESS)
    {
        ref<uint32>(0x04) = Sql_GetIntData(SqlHandle, 0); // Bayld
        ref<uint16>(0x0A) = Sql_GetUIntData(SqlHandle, 1); // Coalition Imprimaturs
        ref<uint8>(0x08) = Sql_GetUIntData(SqlHandle, 2); // Kinetic Units
        ref<uint32>(0x0C) = Sql_GetIntData(SqlHandle, 3); // Obsidian Fragments
		
        ref<uint16>(0x10) = Sql_GetUIntData(SqlHandle, 4); // Lebondopt Wings
        ref<uint16>(0x12) = Sql_GetUIntData(SqlHandle, 5); // Pulchridopt Wings
        ref<uint16>(0x48) = Sql_GetIntData(SqlHandle, 6); // Mellidopt Wings
		
		ref<uint8>(0x18) = Sql_GetIntData(SqlHandle, 7); // Ghastly Stone
		ref<uint8>(0x19) = Sql_GetIntData(SqlHandle, 8); // Ghastly Stone +1
		ref<uint8>(0x1A) = Sql_GetIntData(SqlHandle, 9); // Ghastly Stone +2
		
		ref<uint8>(0x1B) = Sql_GetIntData(SqlHandle, 10); // Verdigris Stone
		ref<uint8>(0x1C) = Sql_GetIntData(SqlHandle, 11); // Verdigris Stone +1
		ref<uint8>(0x1D) = Sql_GetIntData(SqlHandle, 12); // Verdigris Stone +2
		
		ref<uint8>(0x1E) = Sql_GetIntData(SqlHandle, 13); // Wailing Stone
		ref<uint8>(0x1F) = Sql_GetIntData(SqlHandle, 14); // Wailing Stone +1
		ref<uint8>(0x20) = Sql_GetIntData(SqlHandle, 15); // Wailing Stone +2
		
		ref<uint8>(0x21) = Sql_GetIntData(SqlHandle, 16); // Snowslit Stone
		ref<uint8>(0x22) = Sql_GetIntData(SqlHandle, 17); // Snowslit Stone +1
		ref<uint8>(0x23) = Sql_GetIntData(SqlHandle, 18); // Snowslit Stone +2
		ref<uint8>(0x24) = Sql_GetIntData(SqlHandle, 19); // Snowtip Stone
		ref<uint8>(0x25) = Sql_GetIntData(SqlHandle, 20); // Snowtip Stone +1
		ref<uint8>(0x26) = Sql_GetIntData(SqlHandle, 21); // Snowtip Stone +2
		ref<uint8>(0x27) = Sql_GetIntData(SqlHandle, 22); // Snowdim Stone
		ref<uint8>(0x28) = Sql_GetIntData(SqlHandle, 23); // Snowdim Stone +1
		ref<uint8>(0x29) = Sql_GetIntData(SqlHandle, 24); // Snowdim Stone +2
		ref<uint8>(0x2A) = Sql_GetIntData(SqlHandle, 25); // Snoworb Stone
		ref<uint8>(0x2B) = Sql_GetIntData(SqlHandle, 26); // Snoworb Stone +1
		ref<uint8>(0x2C) = Sql_GetIntData(SqlHandle, 27); // Snoworb Stone +2
		
		ref<uint8>(0x2D) = Sql_GetIntData(SqlHandle, 28); // Leafslit Stone
		ref<uint8>(0x2E) = Sql_GetIntData(SqlHandle, 29); // Leafslit Stone +1
		ref<uint8>(0x2F) = Sql_GetIntData(SqlHandle, 30); // Leafslit Stone +2
		ref<uint8>(0x30) = Sql_GetIntData(SqlHandle, 31); // Leaftip Stone
		ref<uint8>(0x31) = Sql_GetIntData(SqlHandle, 32); // Leaftip Stone +1
		ref<uint8>(0x32) = Sql_GetIntData(SqlHandle, 33); // Leaftip Stone +2
		ref<uint8>(0x33) = Sql_GetIntData(SqlHandle, 34); // Leafdim Stone
		ref<uint8>(0x34) = Sql_GetIntData(SqlHandle, 35); // Leafdim Stone +1
		ref<uint8>(0x35) = Sql_GetIntData(SqlHandle, 36); // Leafdim Stone +2
		ref<uint8>(0x36) = Sql_GetIntData(SqlHandle, 37); // Leaforb Stone
		ref<uint8>(0x37) = Sql_GetIntData(SqlHandle, 38); // Leaforb Stone +1
		ref<uint8>(0x38) = Sql_GetIntData(SqlHandle, 39); // Leaforb Stone +2
		
		ref<uint8>(0x39) = Sql_GetIntData(SqlHandle, 40); // Duskslit Stone
		ref<uint8>(0x3A) = Sql_GetIntData(SqlHandle, 41); // Duskslit Stone +1
		ref<uint8>(0x3B) = Sql_GetIntData(SqlHandle, 42); // Duskslit Stone +2
		ref<uint8>(0x3C) = Sql_GetIntData(SqlHandle, 43); // Dusktip Stone
		ref<uint8>(0x3D) = Sql_GetIntData(SqlHandle, 44); // Dusktip Stone +1
		ref<uint8>(0x3E) = Sql_GetIntData(SqlHandle, 45); // Dusktip Stone +2
		ref<uint8>(0x3F) = Sql_GetIntData(SqlHandle, 46); // Duskdim Stone
		ref<uint8>(0x40) = Sql_GetIntData(SqlHandle, 47); // Duskdim Stone +1
		ref<uint8>(0x41) = Sql_GetIntData(SqlHandle, 48); // Duskdim Stone +2
		ref<uint8>(0x42) = Sql_GetIntData(SqlHandle, 49); // Duskorb Stone
		ref<uint8>(0x43) = Sql_GetIntData(SqlHandle, 50); // Duskorb Stone +1
		ref<uint8>(0x44) = Sql_GetIntData(SqlHandle, 51); // Duskorb Stone +2
		
		ref<uint32>(0x14) = Sql_GetIntData(SqlHandle, 52); // Mweya Plasm

		ref<uint32>(0x4C) = Sql_GetIntData(SqlHandle, 53); // Escha Silt
		ref<uint16>(0x4A) = Sql_GetIntData(SqlHandle, 54); // Escha Bead

		ref<uint8>(0x45) = Sql_GetIntData(SqlHandle, 55); // Pellucid Stone
		ref<uint8>(0x46) = Sql_GetIntData(SqlHandle, 56); // Fern Stone
		ref<uint8>(0x47) = Sql_GetIntData(SqlHandle, 57); // Taupe Stone

		ref<uint16>(0x50) = Sql_GetIntData(SqlHandle, 58); // Potpourri

		ref<uint32>(0x60) = Sql_GetIntData(SqlHandle, 59); // Crafter Point
		
		ref<uint8>(0x64) = Sql_GetIntData(SqlHandle, 60); // Fire Focus
		ref<uint8>(0x65) = Sql_GetIntData(SqlHandle, 61); // Ice Focus
		ref<uint8>(0x66) = Sql_GetIntData(SqlHandle, 62); // Wind Focus
		ref<uint8>(0x67) = Sql_GetIntData(SqlHandle, 63); // Earth Focus
		ref<uint8>(0x68) = Sql_GetIntData(SqlHandle, 64); // Lightning Focus
		ref<uint8>(0x69) = Sql_GetIntData(SqlHandle, 65); // Water Focus
		ref<uint8>(0x6A) = Sql_GetIntData(SqlHandle, 66); // Light Focus
		ref<uint8>(0x6B) = Sql_GetIntData(SqlHandle, 67); // Dark Focus
		
		ref<uint8>(0x6C) = Sql_GetIntData(SqlHandle, 68); // MC-I-SR01
		ref<uint8>(0x6D) = Sql_GetIntData(SqlHandle, 69); // MC-I-SR02
		ref<uint8>(0x6E) = Sql_GetIntData(SqlHandle, 70); // MC-I-SR03
		
		ref<uint8>(0x6F) = Sql_GetIntData(SqlHandle, 71); // Liquefaction Sphere
		ref<uint8>(0x70) = Sql_GetIntData(SqlHandle, 72); // Induration Sphere
		ref<uint8>(0x71) = Sql_GetIntData(SqlHandle, 73); // Detonation Sphere
		ref<uint8>(0x72) = Sql_GetIntData(SqlHandle, 74); // Scission Sphere
		ref<uint8>(0x73) = Sql_GetIntData(SqlHandle, 75); // Impaction Sphere
		ref<uint8>(0x74) = Sql_GetIntData(SqlHandle, 76); // Reverbration Sphere
		ref<uint8>(0x75) = Sql_GetIntData(SqlHandle, 77); // Transfixion Sphere
		ref<uint8>(0x76) = Sql_GetIntData(SqlHandle, 78); // Compression Sphere
		ref<uint8>(0x77) = Sql_GetIntData(SqlHandle, 79); // Fusion Sphere
		ref<uint8>(0x78) = Sql_GetIntData(SqlHandle, 80); // Distortion Sphere
		ref<uint8>(0x79) = Sql_GetIntData(SqlHandle, 81); // Fragmentation Sphere
		ref<uint8>(0x7A) = Sql_GetIntData(SqlHandle, 82); // Gravitation Sphere
		ref<uint8>(0x7B) = Sql_GetIntData(SqlHandle, 83); // Light Sphere
		ref<uint8>(0x7C) = Sql_GetIntData(SqlHandle, 84); // Dark Sphere

		ref<uint32>(0x54) = Sql_GetIntData(SqlHandle, 85); // Hallmark
		ref<uint32>(0x58) = Sql_GetIntData(SqlHandle, 86); // Total Hallmark
		ref<uint32>(0x5C) = Sql_GetIntData(SqlHandle, 87); // Gallantry

		ref<uint32>(0x80) = Sql_GetIntData(SqlHandle, 88); // Silver Aman
//		ref<uint16>(0x7D) = 90; // Sql_GetIntData(SqlHandle, 89); // Canteen
    }
}