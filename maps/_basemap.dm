#include "map_files\generic\Admin_level.dmm"

#ifdef ALL_MAPS
	#ifdef CIBUILDING
		#if defined(ALL_MAPS_STAGE_BASE)
			#include "templates_base.dm"
		#elif defined(ALL_MAPS_STAGE_EXTRA)
			#include "templates_extra.dm"
		#else
			#include "templates_base.dm"
			#include "templates_extra.dm"
		#endif
	#endif
#endif
