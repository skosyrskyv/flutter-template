// ignore_for_file: constant_identifier_names

// --- PROTOCOLS --- //
const String _HTTP = 'http';
const String _HTTPS = 'https';

// --- HOSTS --- //
const String _PROD_HOST_NAME = 'prod server';
const String _TEST_HOST_NAME = 'test server';

// --- API --- //
const String _API_PATH = 'api/path';
const String _API_VERSION = 'v1';

// ---------------------- SETTINGS --------------------------------------------
// Change these constants for environment setup.                               |
//                                                                             |
const String PROTOCOL = _HTTPS; //                                             |
const String HOST_NAME = _PROD_HOST_NAME; //                                   |
const String API_URL = "$PROTOCOL://$HOST_NAME/$_API_PATH/$_API_VERSION/"; //  |
//                                                                             |
// ----------------------------------------------------------------------------
