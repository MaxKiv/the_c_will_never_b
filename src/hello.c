#include "gdextension_interface.h"
#include <stdio.h>

void initialize(void *userdata, GDExtensionInitializationLevel p_level) {
  printf("initialize at level %d\n", p_level);
}

void deinitialize(void *userdata, GDExtensionInitializationLevel p_level) {
  printf("deinitialize at level %d\n", p_level);
}

GDExtensionBool entry(GDExtensionInterfaceGetProcAddress p_get_proc_address,
                      GDExtensionClassLibraryPtr p_library,
                      GDExtensionInitialization *r_initialization) {
  // setup the `initialize` function
  r_initialization->initialize = &initialize;
  // setup the `deinitialize` function
  r_initialization->deinitialize = &deinitialize;
  return 1;
}
