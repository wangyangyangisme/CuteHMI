#ifndef H_MODULES_CUTEHMI__TERMOBOT__1_INCLUDE_CUTEHMI_TERMOBOT_INTERNAL_COMMON_HPP
#define H_MODULES_CUTEHMI__TERMOBOT__1_INCLUDE_CUTEHMI_TERMOBOT_INTERNAL_COMMON_HPP

#include "../metadata.hpp"
#include "../logging.hpp"

#include <cutehmi/MPtr.hpp>

#include <QtGlobal>

#ifdef CUTEHMI_TERMOBOT_DYNAMIC
	#ifdef CUTEHMI_TERMOBOT_BUILD
		//export symbols to dll
		#define CUTEHMI_TERMOBOT_API Q_DECL_EXPORT
	#else
		//using functions from dll
		#define CUTEHMI_TERMOBOT_API Q_DECL_IMPORT
	#endif
#else
	#define CUTEHMI_TERMOBOT_API
#endif

#endif
