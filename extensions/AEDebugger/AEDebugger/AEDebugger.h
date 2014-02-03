//
//  CosmicImpact.h
//  CosmicImpact
//
//  Created by David Wimsey on 4/13/12.
//  Copyright (c) 2012 David Wimsey. All rights reserved.
//

#ifndef __AMBIENCEENGINE_EXTENSION_AEDEBUGGER_H_INCLUDED__
#define __AMBIENCEENGINE_EXTENSION_AEDEBUGGER_H_INCLUDED__ 1

#ifdef __cplusplus
extern "C" {
#endif

using namespace AmbienceEngine;

namespace AEDebugger {

typedef void (*aerlevent_callback_func)(const void *pEngine, const void *vpPtr, const void *dPtr, const void *cookie, const void *evtPtr);

}
#ifdef __cplusplus
}
#endif

#endif // !__AMBIENCEENGINE_EXTENSION_AEDEBUGGER_H_INCLUDED__
