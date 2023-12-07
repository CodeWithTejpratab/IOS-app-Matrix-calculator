// python_wrapper.c
#include <Python.h>
#include <CoreFoundation/CoreFoundation.h>

// Function prototypes
void InitializePythonRuntime(void);
double add_numbers(double num1, double num2);

void InitializePythonRuntime(void) {
    // Only initialize Python once.
    if (!Py_IsInitialized()) {
        // Obtain the path to the app bundle
        CFBundleRef mainBundle = CFBundleGetMainBundle();

        // Get the path to the python-stdlib directory
        CFURLRef pythonStdlibURL = CFBundleCopyResourceURL(mainBundle, CFSTR("python-stdlib"), NULL, NULL);
        char pythonStdlibPath[PATH_MAX];
        if (!CFURLGetFileSystemRepresentation(pythonStdlibURL, TRUE, (UInt8 *)pythonStdlibPath, PATH_MAX)) {
            // Handle the error
            fprintf(stderr, "Failed to get file system representation.\n");
            if (pythonStdlibURL) CFRelease(pythonStdlibURL);
            return;
        }
        CFRelease(pythonStdlibURL); // Release the CFURLRef object

        // Convert the path to a wide character string
        wchar_t *wPythonStdlibPath = Py_DecodeLocale(pythonStdlibPath, NULL);
        if (wPythonStdlibPath == NULL) {
            // Handle error
            fprintf(stderr, "Failed to decode locale.\n");
            return;
        }
        
        // Set the Python home to the standard library path
        Py_SetPythonHome(wPythonStdlibPath);
        
        // Initialize the Python interpreter
        Py_Initialize();

        // Free the allocated wide character string
        PyMem_RawFree(wPythonStdlibPath);
    }
}

double add_numbers(double num1, double num2) {
    // Make sure Python has already been initialized at this point.
    if (!Py_IsInitialized()) {
        fprintf(stderr, "Python is not initialized.\n");
        return -1;
    }

    // Import the Python module
    PyObject *pName = PyUnicode_DecodeFSDefault("addition");
    PyObject *pModule = PyImport_Import(pName);
    Py_DECREF(pName);

    if (pModule != NULL) {
        PyObject *pFunc = PyObject_GetAttrString(pModule, "add_numbers");

        // Call the Python function
        if (pFunc && PyCallable_Check(pFunc)) {
            PyObject *pArgs = PyTuple_Pack(2, PyFloat_FromDouble(num1), PyFloat_FromDouble(num2));
            PyObject *pValue = PyObject_CallObject(pFunc, pArgs);
            Py_DECREF(pArgs);

            if (pValue != NULL) {
                double result = PyFloat_AsDouble(pValue);
                Py_DECREF(pValue);
                Py_DECREF(pFunc);
                Py_DECREF(pModule);
                return result;
            } else {
                Py_DECREF(pFunc);
                Py_DECREF(pModule);
                PyErr_Print();
                fprintf(stderr,"Call failed\n");
                return -1;
            }
        } else {
            if (PyErr_Occurred())
                PyErr_Print();
            fprintf(stderr, "Cannot find function \"add_numbers\"\n");
        }
        Py_XDECREF(pFunc);
        Py_DECREF(pModule);
    } else {
        PyErr_Print();
        fprintf(stderr, "Failed to load \"addition\"\n");
    }
    return -1;
}
