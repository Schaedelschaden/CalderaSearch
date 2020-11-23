-----------------------------------
-- Area: West Ronfaure
--  NPC: Zovriace
-- Type: Patrol NPC
-- !pos -436.356 -15.851 -258.168 100
-----------------------------------
local ID = require("scripts/zones/West_Ronfaure/IDs")
require("scripts/globals/pathfind")
require("scripts/globals/utils")
-----------------------------------

local path =
{
    {-439.970, -16.752, -255.100},
    {-440.602, -16.538, -255.958},
    {-441.127, -16.394, -256.900},
    {-441.494, -16.267, -257.915},
    {-441.581, -16.133, -258.985},
    {-441.024, -16.028, -259.826},
    {-439.954, -16.028, -259.822},
    {-438.925, -16.072, -259.474},
    {-437.941, -16.180, -259.014},
    {-437.021, -15.868, -258.524},
    {-436.108, -15.583, -258.000},
    {-435.179, -15.400, -257.455},
    {-432.864, -15.075, -256.065},
    {-423.557, -14.982, -250.437},
    {-422.761, -15.055, -249.708},
    {-422.268, -15.117, -248.744},
    {-421.972, -15.198, -247.701},
    {-421.776, -15.333, -246.640},
    {-421.618, -15.467, -245.572},
    {-421.478, -15.717, -244.517},
    {-421.351, -15.921, -243.463},
    {-421.186, -16.198, -241.860},
    {-421.114, -16.145, -240.774},
    {-421.063, -16.139, -239.687},
    {-420.994, -16.130, -237.785},
    {-420.230, -15.989, -211.979},
    {-420.197, -15.922, -210.893},
    {-420.124, -15.798, -207.772},
    {-420.100, -15.813, -206.552},
    {-419.909, -16.017, -199.219},
    {-420.047, -16.120, -198.143},
    {-420.387, -15.748, -197.158},
    {-420.822, -15.460, -196.220},
    {-421.321, -15.238, -195.271},
    {-421.853, -15.129, -194.327},
    {-423.947, -15.024, -190.672},
    {-427.640, -14.942, -184.327},
    {-428.275, -15.015, -183.448},
    {-428.993, -15.115, -182.637},
    {-429.774, -15.196, -181.884},
    {-430.584, -15.269, -181.162},
    {-431.407, -15.339, -180.452},
    {-432.945, -15.590, -179.147},
    {-446.838, -18.853, -167.615},
    {-447.872, -18.977, -166.740},
    {-450.464, -19.402, -164.580},
    {-451.186, -19.500, -163.781},
    {-451.724, -19.500, -162.836},
    {-452.156, -19.526, -161.839},
    {-452.542, -19.574, -160.823},
    {-452.902, -19.619, -159.797},
    {-453.247, -19.652, -158.765},
    {-454.379, -19.973, -155.298},
    {-455.345, -20.866, -152.299},
    {-455.671, -20.945, -151.285},
    {-456.993, -21.072, -147.165},
    {-457.321, -21.268, -146.147},
    {-460.919, -21.558, -134.955},
    {-461.252, -21.516, -133.920},
    {-463.684, -20.974, -126.322},
    {-463.735, -21.005, -125.238},
    {-463.618, -21.100, -124.159},
    {-463.476, -21.130, -123.083},
    {-460.845, -21.814, -103.009},
    {-460.340, -21.860, -102.053},
    {-459.548, -21.859, -101.316},
    {-458.651, -21.799, -100.705},
    {-457.715, -21.738, -100.153},
    {-456.764, -21.662,  -99.631},
    {-455.801, -21.716,  -99.128},
    {-452.543, -21.461,  -97.451},
    {-427.263, -19.779,  -84.644},
    {-426.292, -19.805,  -84.153},
    {-424.000, -20.058,  -82.994},
    {-423.030, -19.983,  -82.507},
    {-396.179, -20.642,  -68.915},
    {-395.230, -20.758,  -68.394},
    {-394.369, -20.974,  -67.755},
    {-393.589, -21.246,  -67.048},
    {-392.859, -21.419,  -66.273},
    {-392.153, -21.557,  -65.456},
    {-391.468, -21.778,  -64.640},
    {-390.559, -22.323,  -63.552},
    {-389.849, -22.824,  -62.691},
    {-387.739, -24.336,  -60.088},
    {-387.035, -24.853,  -59.230},
    {-386.339, -25.370,  -58.366},
    {-385.651, -26.125,  -57.510},
    {-385.033, -27.045,  -56.701},
    {-384.452, -27.587,  -55.817},
    {-383.951, -27.987,  -54.938},
    {-383.386, -28.294,  -53.910},
    {-382.906, -28.606,  -52.984},
    {-382.409, -28.917,  -52.069},
    {-381.867, -29.025,  -51.137},
    {-381.301, -29.172,  -50.219},
    {-380.727, -29.320,  -49.307},
    {-364.454, -30.016,  -24.085},
    {-354.090, -29.671,   -8.006},
    {-353.540, -29.834,   -7.080},
    {-353.008, -30.037,   -6.150},
    {-351.508, -30.500,   -3.461},
    {-344.298, -31.130,    9.622},
    {-343.719, -31.229,   10.534},
    {-343.014, -31.336,   11.354},
    {-342.196, -31.448,   12.062},
    {-341.337, -31.562,   12.721},
    {-340.463, -31.676,   13.359},
    {-339.578, -31.747,   13.983},
    {-338.684, -31.777,   14.604},
    {-331.282, -31.493,   19.661},
    {-330.308, -31.447,   20.141},
    {-329.288, -31.455,   20.518},
    {-328.249, -31.395,   20.818},
    {-327.199, -31.337,   21.087},
    {-326.141, -31.381,   21.338},
    {-325.082, -31.432,   21.581},
    {-320.835, -31.395,   22.525},
    {-319.773, -31.337,   22.757},
    {-316.724, -31.168,   23.434},
    {-315.697, -31.067,   23.774},
    {-314.713, -31.001,   24.234},
    {-313.761, -30.953,   24.758},
    {-312.835, -30.887,   25.325},
    {-311.918, -30.789,   25.902},
    {-310.216, -30.826,   27.010},
    {-307.517, -31.226,   28.788},
    {-306.582, -31.154,   29.342},
    {-305.625, -31.055,   29.852},
    {-304.660, -30.967,   30.347},
    {-303.691, -30.867,   30.831},
    {-301.273, -30.522,   32.021},
    {-300.325, -30.253,   32.488},
    {-297.896, -29.961,   33.678},
    {-296.921, -29.980,   34.155},
    {-283.175, -30.000,   40.879},
    {-282.197, -30.000,   41.357},
    {-273.907, -30.223,   45.435},
    {-273.112, -30.613,   46.087},
    {-272.551, -31.027,   46.919},
    {-272.154, -31.419,   47.850},
    {-271.860, -31.801,   48.831},
    {-271.583, -32.090,   49.799},
    {-271.340, -32.425,   50.806},
    {-270.992, -32.844,   52.328},
    {-269.161, -35.016,   60.795},
    {-268.899, -35.537,   62.046},
    {-267.436, -38.003,   68.796},
    {-267.218, -38.403,   69.785},
    {-266.716, -39.181,   72.162},
    {-266.646, -39.236,   73.245},
    {-266.741, -39.305,   74.326},
    {-266.943, -39.503,   75.379},
    {-267.198, -39.606,   76.420},
    {-267.467, -39.573,   77.473},
    {-267.751, -39.537,   78.523},
    {-269.489, -39.688,   84.654},
    {-269.779, -39.940,   85.672},
    {-270.407, -40.357,   87.859},
    {-270.701, -40.217,   88.897},
    {-271.803, -39.582,   92.765},
    {-272.103, -39.621,   93.822},
    {-274.938, -40.094,  103.757},
    {-275.234, -39.950,  104.796},
    {-278.316, -39.956,  115.598},
    {-278.657, -40.000,  116.626},
    {-279.067, -40.000,  117.634},
    {-279.518, -40.000,  118.624},
    {-279.993, -40.000,  119.603},
    {-280.484, -40.000,  120.574},
    {-280.980, -40.000,  121.543},
    {-286.929, -39.008,  132.941},
    {-287.430, -38.897,  133.901},
    {-287.937, -38.781,  134.856},
    {-288.510, -38.692,  135.778},
    {-289.157, -38.665,  136.652},
    {-289.833, -38.639,  137.504},
    {-290.523, -38.604,  138.344},
    {-291.396, -38.552,  139.386},
    {-300.068, -35.596,  149.616},
    {-300.450, -35.417,  150.612},
    {-300.480, -35.302,  151.691},
    {-300.363, -35.374,  152.765},
    {-300.181, -35.526,  153.827},
    {-299.967, -35.682,  154.883},
    {-299.740, -35.856,  155.933},
    {-299.166, -36.110,  158.434},
    {-297.842, -36.519,  164.110},
    {-297.711, -36.728,  165.169},
    {-297.791, -36.897,  166.237},
    {-298.034, -37.036,  167.288},
    {-298.354, -37.162,  168.321},
    {-298.708, -37.283,  169.343},
    {-299.123, -37.480,  170.478},
    {-299.870, -38.047,  172.461},
    {-300.458, -38.762,  173.968},
    {-301.121, -39.588,  175.707},
    {-301.488, -39.880,  176.703},
    {-301.741, -40.187,  177.714},
    {-301.840, -40.504,  178.748},
    {-301.855, -40.822,  179.788},
    {-301.822, -41.188,  180.817},
    {-301.758, -41.552,  181.840},
    {-301.682, -41.920,  182.862},
    {-301.407, -42.825,  186.114},
    {-300.501, -45.446,  196.063},
    {-300.327, -45.781,  197.086},
    {-300.107, -46.023,  198.101},
    {-299.892, -46.020,  199.202},
    {-299.658, -46.049,  200.264},
    {-299.083, -45.989,  202.775},
    {-298.839, -45.840,  203.825},
    {-298.599, -45.612,  204.856},
    {-297.294, -45.038,  210.384},
    {-296.802, -45.031,  211.348},
    {-296.003, -44.947,  212.076},
    {-295.089, -44.939,  212.665},
    {-294.132, -44.971,  213.180},
    {-293.159, -45.004,  213.666},
    {-292.177, -45.043,  214.134},
    {-290.945, -45.035,  214.709},
    {-282.860, -45.922,  218.423},
    {-281.928, -46.162,  218.882},
    {-280.925, -46.093,  219.302},
    {-279.942, -46.035,  219.765},
    {-278.976, -46.039,  220.261},
    {-278.019, -46.126,  220.774},
    {-276.532, -45.679,  221.595},
    {-273.266, -45.098,  223.469},
    {-272.324, -45.015,  224.010},
    {-268.550, -45.024,  226.176},
    {-267.745, -45.022,  226.900},
    {-267.117, -44.979,  227.787},
    {-266.573, -44.975,  228.729},
    {-266.066, -44.982,  229.691},
    {-265.576, -45.041,  230.663},
    {-265.079, -45.163,  231.627},
    {-264.597, -45.264,  232.595},
    {-264.152, -45.446,  233.563},
    {-263.697, -45.680,  234.523},
    {-262.016, -46.281,  238.029},
    {-261.556, -46.201,  239.014},
    {-256.600, -45.025,  249.377},
    {-255.970, -44.957,  250.260},
    {-255.212, -44.939,  251.038},
    {-254.386, -44.945,  251.745},
    {-253.526, -44.969,  252.411},
    {-252.652, -45.002,  253.058},
    {-251.770, -45.036,  253.696},
    {-244.441, -45.275,  258.863},
    {-243.505, -45.542,  259.357},
    {-242.523, -45.906,  259.648},
    {-241.460, -46.028,  259.823},
    {-240.374, -46.019,  259.894},
    {-239.287, -46.013,  259.945},
    {-238.200, -46.008,  259.982},
    {-235.359, -46.299,  260.041},
    {-231.212, -47.047,  260.111},
    {-228.414, -47.613,  260.165},
    {-227.395, -48.089,  260.184},
    {-225.697, -48.950,  260.216},
    {-224.363, -49.629,  260.239},
    {-223.352, -49.953,  260.253},
    {-216.001, -52.412,  260.375},
    {-214.947, -52.636,  260.390},
    {-204.417, -55.326,  260.560},
    {-203.368, -55.655,  260.576},
    {-202.049, -56.112,  260.577},
    {-200.935, -56.080,  260.591},
    {-184.915, -56.834,  260.617},
    {-183.857, -57.100,  260.594},
    {-182.771, -57.095,  260.613},
    {-181.551, -57.195,  260.611},
    {-180.467, -57.268,  260.554},
    {-179.388, -57.235,  260.443},
    {-178.313, -57.323,  260.301},
    {-177.240, -57.410,  260.141},
    {-175.639, -57.602,  259.888},
    {-153.454, -59.971,  256.230},
    {-152.371, -59.941,  256.202},
    {-151.338, -59.899,  256.526},
    {-150.409, -59.899,  257.091},
    {-149.546, -59.905,  257.754},
    {-148.712, -59.944,  258.451},
    {-147.891, -59.982,  259.164},
    {-147.077, -59.987,  259.886},
    {-145.559, -59.996,  261.249},
    {-135.296, -61.920,  270.550, {delay = 5}}, -- report
    {-136.884, -61.542,  269.110},
    {-150.086, -59.899,  257.147},
    {-151.020, -59.899,  256.592},
    {-152.073, -59.902,  256.345},
    {-153.159, -59.929,  256.347},
    {-154.243, -59.956,  256.436},
    {-155.322, -59.991,  256.572},
    {-156.398, -59.956,  256.729},
    {-158.145, -59.938,  257.003},
    {-178.976, -57.275,  260.436},
    {-180.056, -57.302,  260.523},
    {-181.140, -57.218,  260.571},
    {-182.225, -57.135,  260.593},
    {-183.310, -57.070,  260.604},
    {-184.389, -56.970,  260.592},
    {-185.446, -56.699,  260.612},
    {-186.534, -56.616,  260.619},
    {-188.029, -56.562,  260.618},
    {-207.543, -54.695,  260.506},
    {-208.593, -54.421,  260.490},
    {-227.786, -47.844,  260.176},
    {-228.828, -47.528,  260.161},
    {-230.026, -47.278,  260.139},
    {-234.035, -46.541,  260.063},
    {-240.660, -46.011,  259.960},
    {-241.744, -46.169,  259.869},
    {-242.749, -45.785,  259.621},
    {-243.688, -45.496,  259.184},
    {-244.613, -45.269,  258.647},
    {-245.518, -45.137,  258.052},
    {-246.419, -45.087,  257.445},
    {-247.315, -45.036,  256.830},
    {-249.769, -45.024,  255.119},
    {-254.651, -44.940,  251.663},
    {-255.433, -44.937,  250.909},
    {-256.076, -44.971,  250.033},
    {-256.635, -45.035,  249.102},
    {-257.142, -45.097,  248.142},
    {-257.629, -45.233,  247.177},
    {-258.461, -45.483,  245.483},
    {-259.049, -45.740,  244.276},
    {-259.516, -45.851,  243.307},
    {-264.719, -45.247,  232.364},
    {-265.227, -45.105,  231.261},
    {-265.719, -44.985,  230.292},
    {-266.195, -44.977,  229.313},
    {-266.685, -44.971,  228.342},
    {-267.309, -44.990,  227.454},
    {-268.097, -45.024,  226.706},
    {-268.976, -45.019,  226.065},
    {-269.888, -45.017,  225.473},
    {-270.818, -45.019,  224.907},
    {-271.753, -45.000,  224.352},
    {-273.165, -45.084,  223.535},
    {-274.098, -45.217,  222.991},
    {-275.034, -45.352,  222.454},
    {-276.433, -45.645,  221.653},
    {-278.282, -46.227,  220.580},
    {-279.259, -46.019,  220.105},
    {-280.239, -46.051,  219.636},
    {-281.715, -46.138,  218.944},
    {-295.072, -44.942,  212.826},
    {-295.975, -44.965,  212.229},
    {-296.626, -44.995,  211.363},
    {-297.092, -45.025,  210.383},
    {-297.438, -45.079,  209.353},
    {-297.736, -45.130,  208.308},
    {-298.005, -45.248,  207.260},
    {-298.264, -45.386,  206.212},
    {-299.041, -45.962,  202.959},
    {-299.294, -46.129,  201.913},
    {-299.533, -46.064,  200.852},
    {-299.778, -46.034,  199.792},
    {-300.021, -46.009,  198.732},
    {-300.230, -45.949,  197.678},
    {-300.387, -45.645,  196.654},
    {-300.517, -45.328,  195.618},
    {-300.631, -45.131,  194.554},
    {-300.736, -44.933,  193.489},
    {-301.916, -41.039,  180.393},
    {-301.952, -40.689,  179.362},
    {-301.844, -40.380,  178.326},
    {-301.584, -40.074,  177.315},
    {-301.265, -39.777,  176.319},
    {-300.939, -39.442,  175.363},
    {-300.565, -38.942,  174.325},
    {-300.181, -38.417,  173.289},
    {-299.740, -37.873,  172.134},
    {-299.364, -37.599,  171.148},
    {-298.786, -37.338,  169.644},
    {-298.402, -37.208,  168.635},
    {-298.027, -37.092,  167.620},
    {-297.779, -36.955,  166.573},
    {-297.768, -36.779,  165.501},
    {-297.893, -36.572,  164.441},
    {-298.075, -36.378,  163.386},
    {-298.291, -36.245,  162.328},
    {-298.523, -36.191,  161.267},
    {-299.099, -36.119,  158.749},
    {-300.622, -35.272,  152.185},
    {-300.546, -35.356,  151.112},
    {-300.139, -35.533,  150.124},
    {-299.563, -35.738,  149.226},
    {-298.926, -35.974,  148.366},
    {-298.292, -36.369,  147.566},
    {-297.652, -36.771,  146.784},
    {-296.598, -37.424,  145.524},
    {-289.386, -38.662,  137.017},
    {-288.751, -38.680,  136.135},
    {-288.184, -38.716,  135.207},
    {-287.656, -38.841,  134.261},
    {-286.957, -39.001,  132.948},
    {-286.436, -38.979,  131.993},
    {-285.933, -39.086,  131.035},
    {-279.544, -40.000,  118.786},
    {-279.095, -40.000,  117.795},
    {-278.723, -40.000,  116.773},
    {-278.390, -40.000,  115.739},
    {-278.077, -39.844,  114.705},
    {-277.060, -39.500,  111.198},
    {-271.665, -39.568,   92.294},
    {-271.258, -39.819,   90.879},
    {-269.650, -39.829,   85.218},
    {-269.097, -39.500,   83.293},
    {-266.809, -39.475,   75.200},
    {-266.649, -39.287,   74.141},
    {-266.706, -39.230,   73.057},
    {-266.841, -39.182,   71.979},
    {-267.013, -38.883,   70.972},
    {-267.203, -38.458,   69.986},
    {-267.405, -38.092,   68.997},
    {-267.967, -37.205,   66.336},
    {-269.169, -35.011,   60.768},
    {-269.416, -34.755,   59.608},
    {-271.049, -32.833,   52.036},
    {-271.266, -32.500,   51.020},
    {-271.939, -31.580,   47.963},
    {-272.323, -31.133,   47.024},
    {-273.091, -30.631,   46.207},
    {-273.918, -30.234,   45.609},
    {-274.847, -30.141,   45.052},
    {-275.801, -30.049,   44.537},
    {-276.767, -30.004,   44.039},
    {-277.740, -30.000,   43.551},
    {-295.029, -30.001,   35.084},
    {-296.004, -30.028,   34.606},
    {-298.320, -30.011,   33.472},
    {-299.292, -30.127,   32.998},
    {-300.744, -30.420,   32.287},
    {-301.822, -30.660,   31.766},
    {-305.449, -31.039,   29.961},
    {-306.393, -31.150,   29.427},
    {-307.322, -31.208,   28.864},
    {-308.242, -31.225,   28.287},
    {-309.370, -30.999,   27.554},
    {-313.548, -30.951,   24.807},
    {-314.496, -30.999,   24.278},
    {-315.499, -31.051,   23.858},
    {-316.537, -31.154,   23.544},
    {-317.590, -31.206,   23.277},
    {-318.646, -31.269,   23.025},
    {-319.705, -31.330,   22.782},
    {-328.585, -31.461,   20.809},
    {-329.604, -31.452,   20.447},
    {-330.576, -31.458,   19.959},
    {-331.516, -31.525,   19.415},
    {-332.434, -31.586,   18.835},
    {-333.342, -31.637,   18.237},
    {-334.808, -31.720,   17.253},
    {-341.755, -31.512,   12.505},
    {-342.587, -31.399,   11.814},
    {-343.284, -31.293,   10.987},
    {-343.903, -31.204,   10.098},
    {-344.476, -31.068,    9.182},
    {-345.021, -30.936,    8.250},
    {-345.557, -30.848,    7.308},
    {-346.944, -30.665,    4.819},
    {-352.769, -30.134,   -5.750},
    {-353.430, -29.865,   -6.908},
    {-353.990, -29.703,   -7.826},
    {-354.571, -29.606,   -8.750},
    {-359.278, -30.020,  -16.060},
    {-359.865, -29.940,  -16.974},
    {-366.939, -29.873,  -27.931},
    {-367.528, -29.888,  -28.845},
    {-376.512, -29.969,  -42.758},
    {-377.103, -29.932,  -43.671},
    {-381.560, -29.108,  -50.606},
    {-382.097, -28.962,  -51.540},
    {-382.600, -28.786,  -52.479},
    {-383.076, -28.473,  -53.406},
    {-383.741, -28.044,  -54.676},
    {-384.273, -27.694,  -55.554},
    {-384.877, -27.241,  -56.411},
    {-385.524, -26.414,  -57.283},
    {-386.158, -25.591,  -58.105},
    {-386.828, -24.977,  -58.949},
    {-390.529, -22.315,  -63.529},
    {-392.262, -21.522,  -65.653},
    {-392.948, -21.380,  -66.485},
    {-393.689, -21.182,  -67.244},
    {-394.540, -20.930,  -67.872},
    {-395.454, -20.739,  -68.440},
    {-396.398, -20.635,  -68.968},
    {-397.357, -20.571,  -69.479},
    {-398.320, -20.508,  -69.982},
    {-400.858, -20.346,  -71.281},
    {-416.078, -20.016,  -78.992},
    {-417.048, -19.936,  -79.480},
    {-427.943, -19.760,  -84.990},
    {-428.913, -19.807,  -85.480},
    {-432.057, -20.048,  -87.078},
    {-433.018, -20.206,  -87.563},
    {-434.463, -20.382,  -88.293},
    {-435.430, -20.458,  -88.786},
    {-452.483, -21.459,  -97.418},
    {-453.453, -21.498,  -97.910},
    {-455.629, -21.682,  -99.016},
    {-456.597, -21.676,  -99.507},
    {-459.140, -21.836, -100.792},
    {-459.946, -21.893, -101.510},
    {-460.448, -21.846, -102.472},
    {-460.755, -21.810, -103.514},
    {-460.974, -21.743, -104.577},
    {-461.155, -21.659, -105.647},
    {-461.317, -21.591, -106.720},
    {-461.468, -21.524, -107.796},
    {-463.602, -21.103, -124.129},
    {-463.619, -21.024, -125.213},
    {-463.478, -21.006, -126.292},
    {-463.249, -21.002, -127.355},
    {-462.966, -21.089, -128.399},
    {-462.668, -21.285, -129.427},
    {-462.235, -21.446, -130.840},
    {-460.657, -21.688, -135.754},
    {-460.330, -21.662, -136.789},
    {-455.015, -20.520, -153.317},
    {-454.692, -20.245, -154.319},
    {-452.376, -19.553, -161.505},
    {-451.983, -19.504, -162.518},
    {-451.383, -19.500, -163.425},
    {-450.662, -19.500, -164.235},
    {-449.881, -19.324, -164.978},
    {-449.075, -19.183, -165.695},
    {-448.256, -19.045, -166.398},
    {-447.224, -18.874, -167.267},
    {-446.393, -18.880, -167.969},
    {-444.853, -18.565, -169.265},
    {-429.819, -15.220, -181.753},
    {-429.047, -15.136, -182.514},
    {-428.378, -15.023, -183.364},
    {-427.766, -14.929, -184.258},
    {-427.184, -14.948, -185.176},
    {-426.620, -14.981, -186.106},
    {-420.939, -15.316, -195.861},
    {-420.463, -15.644, -196.799},
    {-420.179, -15.996, -197.782},
    {-420.054, -16.013, -198.776},
    {-420.006, -16.007, -199.863},
    {-419.994, -16.007, -200.951},
    {-420.002, -16.006, -202.039},
    {-420.028, -16.012, -203.534},
    {-420.136, -15.819, -208.158},
    {-420.158, -15.863, -209.517},
    {-420.217, -15.970, -212.114},
    {-420.270, -15.849, -213.198},
    {-420.324, -15.797, -214.692},
    {-420.826, -15.902, -232.085},
    {-420.854, -15.979, -233.178},
    {-421.049, -16.137, -239.834},
    {-421.117, -16.146, -240.920},
    {-421.206, -16.172, -242.004},
    {-421.315, -15.984, -243.070},
    {-421.494, -15.643, -244.787},
    {-421.819, -15.221, -247.595},
    {-422.154, -15.128, -248.622},
    {-422.758, -15.061, -249.519},
    {-423.569, -14.987, -250.238},
    {-424.447, -14.935, -250.876},
    {-425.353, -14.944, -251.478},
    {-426.272, -14.957, -252.060},
    {-427.197, -14.990, -252.632},
    {-435.669, -15.466, -257.761},
    {-436.582, -15.703, -258.315},
    {-437.807, -16.083, -259.079},
    {-438.774, -16.063, -259.543},
    {-439.841, -16.037, -259.752},
    {-440.927, -16.028, -259.821},
    {-442.012, -16.065, -259.827},
    {-443.029, -15.716, -259.796},
    {-444.055, -15.340, -259.815},
    {-445.097, -15.219, -260.104},
    {-446.074, -15.110, -260.570},
    {-447.027, -15.057, -261.092},
    {-447.959, -15.005, -261.650},
    {-448.870, -15.018, -262.244},
    {-452.834, -15.055, -264.874},
    {-453.655, -15.037, -265.585},
    {-454.313, -14.975, -266.448},
    {-454.843, -14.943, -267.396},
    {-455.317, -14.926, -268.376},
    {-455.755, -14.934, -269.371},
    {-456.179, -14.990, -270.372},
    {-458.718, -15.924, -276.598},
    {-459.454, -16.074, -278.487},
    {-459.765, -16.035, -279.529},
    {-460.018, -16.008, -280.586},
    {-460.219, -16.034, -281.655},
    {-460.388, -15.869, -282.697},
    {-460.631, -15.373, -284.238},
    {-463.079, -10.491, -301.043},
    {-463.087, -10.158, -302.077},
    {-462.960,  -9.836, -303.109},
    {-462.774,  -9.560, -304.125},
    {-462.522,  -8.986, -305.196},
    {-462.273,  -8.643, -306.190},
    {-462.021,  -8.278, -307.184},
    {-460.034,  -6.387, -314.867},
    {-459.871,  -6.200, -315.926},
    {-459.784,  -6.106, -317.006},
    {-459.729,  -6.040, -318.091},
    {-459.694,  -6.044, -319.178},
    {-459.585,  -6.053, -324.342},
    {-459.546,  -5.772, -326.638},
    {-459.503,  -5.646, -328.802},
    {-459.475,  -5.742, -330.568},
    {-459.458,  -5.785, -331.654},
    {-459.434,  -5.762, -332.741},
    {-459.407,  -5.823, -334.235},
    {-459.388,  -5.885, -335.321},
    {-459.238,  -5.855, -343.748},
    {-459.212,  -5.653, -345.233},
    {-459.171,  -5.405, -347.661},
    {-459.148,  -5.488, -349.155},
    {-459.102,  -5.651, -351.733},
    {-459.078,  -5.694, -352.820},
    {-459.029,  -6.086, -355.647},
    {-459.029,  -6.127, -356.731},
    {-459.140,  -6.113, -357.812},
    {-459.383,  -6.083, -358.872},
    {-459.727,  -6.040, -359.903},
    {-460.125,  -6.022, -360.915},
    {-460.547,  -6.109, -361.916},
    {-460.983,  -5.974, -362.906},
    {-461.694,  -5.748, -364.503},
    {-464.664,  -4.937, -371.008},
    {-465.236,  -4.933, -371.931},
    {-466.029,  -4.964, -372.673},
    {-466.928,  -4.997, -373.282},
    {-467.884,  -5.034, -373.801},
    {-468.857,  -5.029, -374.286},
    {-469.843,  -5.023, -374.747},
    {-470.833,  -5.019, -375.197},
    {-472.694,  -5.035, -376.029},
    {-473.677,  -5.200, -376.472},
    {-474.661,  -5.361, -376.908},
    {-476.374,  -5.724, -377.667},
    {-477.943,  -6.254, -378.389},
    {-478.940,  -6.155, -378.806},
    {-479.933,  -6.100, -379.246},
    {-480.918,  -6.043, -379.707},
    {-481.900,  -6.081, -380.169},
    {-484.013,  -5.418, -381.186},
    {-491.435,  -5.052, -384.848},
    {-492.353,  -5.041, -385.430},
    {-493.202,  -5.007, -386.109},
    {-493.992,  -4.974, -386.856},
    {-494.756,  -4.940, -387.630},
    {-495.507,  -4.923, -388.417},
    {-496.431,  -4.977, -389.412},
    {-497.107,  -5.046, -390.261},
    {-497.657,  -5.110, -391.197},
    {-498.112,  -5.190, -392.182},
    {-498.507,  -5.332, -393.186},
    {-498.873,  -5.472, -394.200},
    {-499.234,  -5.613, -395.218},
    {-499.678,  -5.800, -396.489},
    {-500.778,  -6.103, -399.830},
    {-501.068,  -6.140, -400.878},
    {-501.285,  -6.187, -401.943},
    {-501.455,  -5.907, -402.972},
    {-501.603,  -5.583, -404.001},
    {-501.743,  -5.360, -405.062},
    {-502.090,  -4.776, -407.835},
    {-503.105,  -2.217, -416.217},
    {-503.239,  -1.832, -417.352},
    {-503.333,  -1.481, -418.377},
    {-503.423,  -1.100, -419.395},
    {-503.386,  -0.703, -420.402},
    {-503.246,  -0.351, -421.441},
    {-502.988,  -0.045, -422.453},
    {-502.687,   0.254, -423.455},
    {-502.373,   0.594, -424.430},
    {-502.022,   1.109, -425.470},
    {-501.691,   1.542, -426.415},
    {-499.392,   3.206, -433.018},
    {-499.253,   3.375, -434.080},
    {-499.522,   3.599, -435.105},
    {-500.032,   3.822, -436.033},
    {-500.653,   3.809, -436.925},
    {-501.312,   3.793, -437.789},
    {-501.987,   3.745, -438.639},
    {-503.010,   3.617, -439.904},
    {-504.546,   3.195, -441.791},
    {-505.474,   3.454, -442.943},
    {-506.260,   3.535, -443.878},
    {-506.956,   3.542, -444.714},
    {-508.938,   3.486, -447.139},
    {-509.594,   3.471, -448.007},
    {-510.234,   3.489, -448.886},
    {-512.427,   3.586, -451.998},
    {-513.936,   3.984, -454.195},
    {-514.540,   4.233, -455.064},
    {-515.166,   4.378, -455.945},
    {-516.262,   4.290, -457.499},
    {-516.891,   4.174, -458.381},
    {-517.627,   3.970, -459.154},
    {-518.497,   3.965, -459.776},
    {-519.472,   3.961, -460.252},
    {-520.468,   3.907, -460.686},
    {-521.475,   3.856, -461.097},
    {-522.467,   3.899, -461.479},
    {-523.431,   4.273, -461.837},
    {-532.930,   4.970, -465.372},
    {-533.836,   5.003, -465.964},
    {-534.517,   5.036, -466.809},
    {-535.063,   5.069, -467.748},
    {-535.532,   5.071, -468.730},
    {-535.968,   5.042, -469.726},
    {-536.385,   4.985, -470.730},
    {-536.996,   4.874, -472.240},
    {-538.487,   4.135, -475.968},
    {-538.877,   4.030, -476.973},
    {-539.262,   3.887, -477.981},
    {-539.575,   3.940, -479.021},
    {-539.779,   3.965, -480.089},
    {-539.916,   3.983, -481.168},
    {-540.027,   3.990, -482.250},
    {-540.122,   3.997, -483.334},
    {-540.210,   3.984, -484.419},
    {-541.090,   3.211, -496.324},
    {-541.168,   3.029, -497.395},
    {-541.225,   2.852, -498.466},
    {-541.208,   2.688, -499.542},
    {-541.137,   2.576, -500.620},
    {-541.029,   2.491, -501.699},
    {-540.901,   2.387, -502.777},
    {-540.700,   2.348, -504.390},
    {-539.072,   0.190, -516.318},
    {-538.841,   0.175, -517.380},
    {-538.530,   0.156, -518.422},
    {-538.178,   0.134, -519.452},
    {-537.805,   0.111, -520.473},
    {-537.424,   0.087, -521.492},
    {-536.306,   0.056, -524.412},
    {-533.919,   0.072, -530.589},
    {-534.307,   0.225, -529.584},
    {-534.697,   0.361, -528.577},
    {-538.121,   0.130, -519.723},
    {-538.474,   0.153, -518.694},
    {-538.752,   0.170, -517.643},
    {-538.969,   0.183, -516.577},
    {-539.157,   0.272, -515.513},
    {-539.318,   0.485, -514.458},
    {-539.542,   0.803, -512.873},
    {-539.692,   0.970, -511.811},
    {-539.838,   1.181, -510.753},
    {-540.765,   2.421, -503.992},
    {-540.907,   2.391, -502.915},
    {-541.162,   2.543, -500.897},
    {-541.213,   2.639, -499.816},
    {-541.198,   2.814, -498.741},
    {-541.153,   2.989, -497.668},
    {-541.090,   3.167, -496.597},
    {-540.901,   3.472, -493.766},
    {-539.946,   3.986, -480.899},
    {-539.758,   3.963, -479.829},
    {-539.464,   3.926, -478.782},
    {-539.127,   3.884, -477.750},
    {-538.753,   4.055, -476.738},
    {-538.086,   4.375, -474.991},
    {-535.247,   5.074, -467.828},
    {-534.701,   5.041, -466.858},
    {-533.907,   5.008, -466.119},
    {-532.972,   4.975, -465.566},
    {-531.983,   4.943, -465.114},
    {-530.979,   4.951, -464.695},
    {-529.968,   4.959, -464.295},
    {-528.951,   4.983, -463.907},
    {-522.430,   3.916, -461.465},
    {-521.404,   3.857, -461.086},
    {-520.377,   3.902, -460.729},
    {-519.369,   3.953, -460.322},
    {-518.443,   3.963, -459.761},
    {-517.644,   3.968, -459.040},
    {-516.927,   4.138, -458.245},
    {-516.257,   4.275, -457.397},
    {-515.619,   4.360, -456.520},
    {-514.989,   4.372, -455.633},
    {-514.354,   4.148, -454.766},
    {-513.569,   3.888, -453.690},
    {-512.848,   3.701, -452.650},
    {-512.268,   3.550, -451.781},
    {-511.656,   3.532, -450.883},
    {-510.565,   3.495, -449.323},
    {-509.924,   3.478, -448.444},
    {-509.263,   3.481, -447.580},
    {-508.588,   3.498, -446.727},
    {-507.732,   3.521, -445.671},
    {-504.967,   3.235, -442.320},
    {-504.184,   3.426, -441.405},
    {-503.524,   3.552, -440.548},
    {-502.838,   3.638, -439.709},
    {-499.995,   3.863, -436.248},
    {-499.458,   3.631, -435.332},
    {-499.354,   3.427, -434.275},
    {-499.518,   3.263, -433.213},
    {-499.786,   3.119, -432.168},
    {-500.093,   2.942, -431.138},
    {-500.416,   2.698, -430.129},
    {-500.756,   2.452, -429.125},
    {-501.102,   2.205, -428.123},
    {-501.993,   1.130, -425.598},
    {-502.375,   0.625, -424.550},
    {-502.760,   0.259, -423.439},
    {-503.125,  -0.073, -422.319},
    {-503.344,  -0.434, -421.301},
    {-503.392,  -0.782, -420.267},
    {-503.345,  -1.156, -419.237},
    {-503.275,  -1.517, -418.212},
    {-503.200,  -1.875, -417.190},
    {-503.092,  -2.185, -416.171},
    {-501.571,  -5.735, -403.501},
    {-501.418,  -6.069, -402.475},
    {-501.176,  -6.153, -401.405},
    {-500.898,  -6.118, -400.354},
    {-500.586,  -6.079, -399.313},
    {-500.255,  -6.038, -398.277},
    {-499.919,  -5.917, -397.250},
    {-498.133,  -5.162, -391.881},
    {-497.607,  -5.099, -390.933},
    {-496.951,  -5.030, -390.068},
    {-496.247,  -4.960, -389.242},
    {-495.526,  -4.922, -388.429},
    {-494.798,  -4.939, -387.620},
    {-494.057,  -4.973, -386.825},
    {-493.242,  -5.007, -386.107},
    {-492.357,  -5.040, -385.475},
    {-491.422,  -5.050, -384.920},
    {-490.463,  -5.046, -384.405},
    {-489.496,  -5.027, -383.907},
    {-488.524,  -5.008, -383.419},
    {-483.903,  -5.444, -381.144},
    {-482.970,  -5.764, -380.673},
    {-482.046,  -6.081, -380.195},
    {-481.059,  -6.036, -379.756},
    {-480.068,  -6.092, -379.310},
    {-478.083,  -6.252, -378.424},
    {-475.939,  -5.600, -377.478},
    {-474.095,  -5.269, -376.659},
    {-472.988,  -5.088, -376.167},
    {-471.997,  -4.996, -375.725},
    {-467.519,  -5.021, -373.745},
    {-466.568,  -4.988, -373.221},
    {-465.785,  -4.954, -372.473},
    {-465.155,  -4.938, -371.586},
    {-464.613,  -4.943, -370.644},
    {-464.112,  -4.970, -369.678},
    {-463.636,  -5.030, -368.702},
    {-463.174,  -5.119, -367.720},
    {-462.721,  -5.261, -366.742},
    {-461.430,  -5.878, -363.953},
    {-460.990,  -5.964, -362.965},
    {-459.656,  -6.049, -359.997},
    {-459.353,  -6.087, -358.954},
    {-459.191,  -6.107, -357.879},
    {-459.106,  -6.118, -356.795},
    {-459.081,  -6.089, -355.710},
    {-459.074,  -5.935, -354.633},
    {-459.104,  -5.658, -351.932},
    {-459.120,  -5.591, -350.846},
    {-459.187,  -5.479, -346.507},
    {-459.430,  -5.749, -332.941},
    {-459.453,  -5.802, -331.854},
    {-459.471,  -5.754, -330.767},
    {-459.490,  -5.694, -329.681},
    {-459.512,  -5.627, -328.459},
    {-459.529,  -5.682, -327.376},
    {-459.596,  -6.022, -323.863},
    {-459.627,  -6.068, -321.961},
    {-459.653,  -6.049, -320.465},
    {-459.672,  -6.047, -319.377},
    {-459.690,  -6.045, -318.289},
    {-459.733,  -6.098, -317.204},
    {-459.866,  -6.163, -316.126},
    {-460.061,  -6.354, -315.070},
    {-460.284,  -6.588, -314.031},
    {-460.533,  -6.826, -312.999},
    {-460.823,  -7.095, -311.840},
    {-462.704,  -9.301, -304.645},
    {-462.954,  -9.692, -303.546},
    {-463.049, -10.017, -302.513},
    {-463.025, -10.351, -301.479},
    {-462.936, -10.689, -300.448},
    {-462.818, -11.044, -299.424},
    {-462.686, -11.409, -298.408},
    {-462.388, -12.191, -296.252},
    {-460.616, -15.430, -284.034},
    {-460.460, -15.766, -283.004},
    {-460.297, -16.098, -281.981},
    {-460.138, -16.023, -280.905},
    {-459.880, -16.021, -279.850},
    {-459.524, -16.066, -278.793},
    {-459.151, -16.112, -277.774},
    {-458.760, -15.948, -276.768},
    {-457.728, -15.418, -274.162},
    {-457.121, -15.183, -272.663},
    {-455.141, -14.929, -267.753},
    {-454.605, -14.961, -266.809},
    {-453.910, -14.994, -265.975},
    {-453.106, -15.028, -265.243},
    {-452.248, -15.071, -264.575},
    {-451.363, -15.070, -263.944},
    {-450.467, -15.049, -263.327},
    {-449.339, -15.027, -262.566},
    {-446.158, -15.106, -260.478},
    {-445.146, -15.217, -260.096},
    {-444.094, -15.313, -259.845},
    {-443.059, -15.693, -259.832},
    {-442.038, -16.061, -259.905},
    {-440.926, -16.011, -259.961},
    {-439.853, -16.029, -259.818},
    {-438.834, -16.076, -259.442},
    {-437.860, -16.135, -258.975},
    {-436.944, -15.842, -258.482},
    {-436.029, -15.561, -257.958},
    {-435.103, -15.389, -257.408},
    {-433.018, -15.096, -256.158},
    {-423.253, -15.007, -250.244},
    {-422.581, -15.076, -249.399},
    {-422.162, -15.134, -248.398},
    {-421.907, -15.243, -247.346},
    {-421.727, -15.378, -246.282},
    {-421.576, -15.511, -245.212},
    {-421.436, -15.814, -244.166},
    {-421.312, -15.977, -243.104},
    {-421.161, -16.151, -241.633},
    {-421.101, -16.144, -240.547},
    {-421.054, -16.138, -239.460},
    {-420.986, -16.129, -237.557},
    {-420.237, -15.986, -212.018},
    {-420.191, -15.916, -210.797},
    {-420.120, -15.789, -207.812},
    {-420.097, -15.820, -206.456},
    {-419.913, -16.017, -199.259},
    {-420.074, -16.138, -198.186},
    {-420.394, -15.806, -197.200},
    {-420.823, -15.475, -196.257},
    {-421.315, -15.246, -195.308},
    {-421.840, -15.131, -194.360},
    {-422.374, -15.078, -193.413},
    {-424.067, -15.028, -190.467},
    {-427.695, -14.944, -184.241},
    {-428.330, -15.027, -183.363},
    {-429.060, -15.124, -182.563},
    {-429.847, -15.204, -181.816},
    {-430.657, -15.276, -181.094},
    {-431.483, -15.340, -180.388},
    {-432.919, -15.584, -179.168},
    {-446.700, -18.848, -167.730},
    {-447.838, -18.971, -166.769},
    {-450.328, -19.379, -164.696},
    {-451.060, -19.534, -163.909},
    {-451.625, -19.500, -162.980},
    {-452.083, -19.517, -161.994},
    {-452.476, -19.566, -160.981},
    {-452.841, -19.611, -159.956},
    {-453.191, -19.646, -158.927},
    {-454.367, -19.964, -155.331},
    {-455.293, -20.791, -152.456},
    {-455.619, -20.976, -151.448},
    {-460.864, -21.582, -135.124},
    {-461.198, -21.523, -134.089},
    {-463.464, -20.982, -127.008},
    {-463.628, -20.996, -125.935},
    {-463.609, -21.038, -124.848},
    {-463.521, -21.146, -123.767},
    {-463.400, -21.146, -122.686},
    {-463.201, -21.188, -121.067},
    {-463.072, -21.257, -119.990},
    {-462.932, -21.293, -118.911},
    {-460.858, -21.810, -103.154},
    {-460.394, -21.855, -102.181},
    {-459.633, -21.864, -101.409},
    {-458.751, -21.805, -100.775},
    {-457.821, -21.747, -100.215},
    {-456.871, -21.669,  -99.690},
    {-455.908, -21.711,  -99.185},
    {-452.652, -21.466,  -97.507},
    {-427.503, -19.772,  -84.766},
    {-426.533, -19.798,  -84.273},
    {-424.118, -20.060,  -83.055},
    {-423.148, -19.991,  -82.567},
}

function onSpawn(npc)
    npc:initNpcPathing(path[1][1], path[1][2], path[1][3])
    onPath(npc)
end

function onPath(npc)
    local point = npc:getPathPoint()

    if point == 289 then
        if npc:getLocalVar("[REPORT_DONE]") == 0 then
            npc:showText(npc, ID.text.ZOVRIACE_REPORT)
            npc:setLocalVar("[REPORT_DONE]",1)
        end
    else
        if npc:getLocalVar("[REPORT_DONE]") ~= 0 then
            npc:setLocalVar("[REPORT_DONE]",0)
        end
    end

    tpz.path.general(npc, path, tpz.path.flag.WALLHACK, false)
end

function onTrade(player, npc, trade)
end

function onTrigger(player, npc)
    player:showText(npc, ID.text.ZOVRIACE_DIALOG)
    npc:clearTargID()
end

function onEventUpdate(player, csid, option)
end

function onEventFinish(player, csid, option)
end