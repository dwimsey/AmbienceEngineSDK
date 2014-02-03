//
//  CosmicImpact.cpp
//  CosmicImpact
//
//  Created by David Wimsey on 1/30/12.
//  Copyright (c) 2012 David Wimsey. All rights reserved.
//

#include "../../../AmbienceEngine/AmbienceEngine/AmbienceEngine.h"
#include "../../../AmbienceEngine/AmbienceEngine/extensions/GUI/AELREvent.h"
#include <math.h>

#include <Rocket/Core.h>
#include <Rocket/Debugger.h>

#include "AEDebugger.h"

using namespace AmbienceEngine;

namespace AEDebugger {

extern "C" {
LPAEXDEFINITION RegisterDebuggerPlugin(void *data, void *arg0);
int AEDebugger_InitModule(AmbienceEngine::AEEngine *enginePtr, const void **dPtr);
void AEDebugger_UpdateLoopCallback(float timeStep, const void *dataPtr);
}

void AEDebugger_UpdateLoopCallback(float timeStep, const void *dataPtr)
{
	if(dataPtr != NULL) {
	}
}

int AEDebugger_InitModule(AEEngine *enginePtr, const void **dPtr)
{
	if(dPtr != NULL) {
		if((*dPtr) == NULL) {
			AEError("Ambience Engine Debugger was not properly registered before calling InitModule: data pointer has NULL data.");
		} else {
			// Load a font from a data URL or something internal for the debugger, so its ALWAYS available.
			// Rocket::Core::FontDatabase::LoadFontFace(Rocket::Core::String("FILE://Fonts/Acknowledgement.otf"));
		}
	} else {
		AEError("Ambience Engine Debugger was not properly registered before calling InitModule: data pointer is NULL.");
	}
	return(0);
}

AEXDEFINITION __AEDebugger_AGMInfo = { "Ambience Engine Debugger", "Engine Extension", NULL, AEDebugger_InitModule, AEDebugger_UpdateLoopCallback, NULL };
#define AGMInfo __AEDebugger_AGMInfo
	
LPAEXDEFINITION RegisterDebuggerPlugin(void *data, void *arg0)
{
	AEEngine *enginePtr = (AEEngine*)data;
	AGMInfo.dataPtr = data;
	return(&AGMInfo);
}

}
