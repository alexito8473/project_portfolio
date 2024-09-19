'use strict';
const MANIFEST = 'flutter-app-manifest';
const TEMP = 'flutter-temp-cache';
const CACHE_NAME = 'flutter-app-cache';

const RESOURCES = {"assets/AssetManifest.bin": "cefa0945337323a929fb83b136737577",
"assets/AssetManifest.bin.json": "d67ee0e9e44493f5d02ca88868852307",
"assets/AssetManifest.json": "0168879c5d44a57bd8b3c7097562abe8",
"assets/assets/images/BackgroundBoat.webp": "2b0b3e365d2598911c3286dd3d79c9cb",
"assets/assets/images/NoWork.webp": "21db22804bacb15b0930ed2e234b6e6e",
"assets/assets/images/personal.webp": "bcf10205696d1ba1a36b5d0793b225c5",
"assets/assets/images/projects/appStudent/1.jpeg": "a6e634f8608fc7654a2134c05b299d5c",
"assets/assets/images/projects/appTeacher/1_new.jpeg": "0826d7e21220f0ccc2f1fc2cb40c609f",
"assets/assets/images/projects/gomoku/1.png": "7f6bca44820672b52c02e69213dcdf48",
"assets/assets/images/projects/goReversi/1.webp": "7bf90a430df0090d577ff861c819dac0",
"assets/assets/images/projects/imcCalculator/1.webp": "e40f9672c52f9c6ec9cb12aa23abdcf5",
"assets/assets/images/projects/tasty/1.webp": "9595e77e627b6c71aba1c2c6b2e36a26",
"assets/assets/images/projects/ultraRestaurant/1.webp": "90de0929f1f330e8c5fc8d4284a5c744",
"assets/assets/pdf/Curriculum_Alejandro_Aguilar_Alba.pdf": "1104daaf646bae3a86e64fd1023a6c9a",
"assets/assets/svg/eclipse.svg": "468d03d6934af4cea7a4175ba3d6c94a",
"assets/assets/svg/git.svg": "5eed2c8cb62e1adfae09b0129a25a1a7",
"assets/assets/svg/github.svg": "91fc7cd187b65073322024169d2cd416",
"assets/assets/svg/intellij.svg": "12dd7832374a7b7f9406c6ed7388e908",
"assets/assets/svg/languageCode.svg": "13da1cf1b808d6343f46b0a76e2dca59",
"assets/assets/svg/linkedin.svg": "2c20928ddc18c3e2ac70e6f8f38ca825",
"assets/assets/svg/programLanguage/android.svg": "591117075fc95dd71b6a3563a08766fd",
"assets/assets/svg/programLanguage/css.svg": "8f7247295a43d53a6cb70a10f463b4de",
"assets/assets/svg/programLanguage/dart.svg": "77736b70355db3b992d712891749acd5",
"assets/assets/svg/programLanguage/firebase.svg": "8e09fe510dfd2abb40f1be63faa4e7cc",
"assets/assets/svg/programLanguage/flutter.svg": "9a6e81be6ff5b09956f4f85fe1f0a89f",
"assets/assets/svg/programLanguage/html.svg": "6f3d69949ef38223d94a5a78a0ecd6ca",
"assets/assets/svg/programLanguage/java.svg": "45f6ff15dcfe17b99a87bcbd6f9d7582",
"assets/assets/svg/programLanguage/javascript.svg": "ca60a139a15167ae52f9d9b65cb718ad",
"assets/assets/svg/programLanguage/kotlin.svg": "de7c472e6f5cfd4e95557fcde4b0c3aa",
"assets/assets/svg/programLanguage/maui.svg": "afe88915b28caa9b114736d3ef5603fe",
"assets/assets/svg/programLanguage/mongoDb.svg": "cae33adfcd23c8c5002505082bf7661a",
"assets/assets/svg/programLanguage/mysql.svg": "99d08f9e2966e406024b603a51460338",
"assets/assets/svg/programLanguage/php.svg": "8f60f267ab3167a696b89d9267cd8dcc",
"assets/assets/svg/programLanguage/python.svg": "85368627053aa7df8e1340c0f29acdb8",
"assets/assets/svg/programLanguage/spring.svg": "1c963b52830704f69efe489b3b1167a6",
"assets/assets/svg/project.svg": "933f33f79b3b96dfbfeb968d6fa9f2ba",
"assets/assets/svg/visualStudio.svg": "ec257ddd94fa88701961ccd3bfda37db",
"assets/FontManifest.json": "dc3d03800ccca4601324923c0b1d6d57",
"assets/fonts/MaterialIcons-Regular.otf": "1a4c4d86dda37787940499065f328f27",
"assets/NOTICES": "480acc767b4fee0bb43b552582ffdf8c",
"assets/packages/cupertino_icons/assets/CupertinoIcons.ttf": "e85f81421cba2b29f95d75066c7c09a6",
"assets/packages/mobkit_dashed_border/images/type1.png": "9f8e612a54622229bd4b97e5357a473c",
"assets/packages/mobkit_dashed_border/images/type2.png": "17a23dec244c3d1bb5b4ae67d7bd48b3",
"assets/packages/mobkit_dashed_border/images/type3.png": "2d50ab9d78a15b2f20012c3b9ea56c46",
"assets/packages/mobkit_dashed_border/images/type4.png": "9250b4ccf17768b5c7d6afcaebadf3f9",
"assets/shaders/ink_sparkle.frag": "ecc85a2e95f5e9f53123dcaf8cb9b6ce",
"canvaskit/canvaskit.js": "5fda3f1af7d6433d53b24083e2219fa0",
"canvaskit/canvaskit.js.symbols": "48c83a2ce573d9692e8d970e288d75f7",
"canvaskit/canvaskit.wasm": "1f237a213d7370cf95f443d896176460",
"canvaskit/chromium/canvaskit.js": "87325e67bf77a9b483250e1fb1b54677",
"canvaskit/chromium/canvaskit.js.symbols": "a012ed99ccba193cf96bb2643003f6fc",
"canvaskit/chromium/canvaskit.wasm": "b1ac05b29c127d86df4bcfbf50dd902a",
"canvaskit/skwasm.js": "9fa2ffe90a40d062dd2343c7b84caf01",
"canvaskit/skwasm.js.symbols": "262f4827a1317abb59d71d6c587a93e2",
"canvaskit/skwasm.wasm": "9f0c0c02b82a910d12ce0543ec130e60",
"canvaskit/skwasm.worker.js": "bfb704a6c714a75da9ef320991e88b03",
"favicon.png": "5dcef449791fa27946b3d35ad8803796",
"flutter.js": "f31737fb005cd3a3c6bd9355efd33061",
"flutter_bootstrap.js": "503a5707c810c3b11f7370aeaac58755",
"icons/Icon-192.png": "ac9a721a12bbc803b44f645561ecb1e1",
"icons/Icon-512.png": "96e752610906ba2a93c65f8abe1645f1",
"icons/Icon-maskable-192.png": "c457ef57daa1d16f64b27b786ec2ea3c",
"icons/Icon-maskable-512.png": "301a7604d45b3e739efc881eb04896ea",
"icons/languageCode.svg": "13da1cf1b808d6343f46b0a76e2dca59",
"index.html": "ab604512acdf494d6ea958b577940217",
"/": "ab604512acdf494d6ea958b577940217",
"main.dart.js": "14b42852f93b168a7a22b453dcf6202f",
"manifest.json": "f471a7c0d026d4db558873a2525269b2",
"version.json": "875a719c6a564058c9e63c6f2853302f"};
// The application shell files that are downloaded before a service worker can
// start.
const CORE = ["main.dart.js",
"index.html",
"flutter_bootstrap.js",
"assets/AssetManifest.bin.json",
"assets/FontManifest.json"];

// During install, the TEMP cache is populated with the application shell files.
self.addEventListener("install", (event) => {
  self.skipWaiting();
  return event.waitUntil(
    caches.open(TEMP).then((cache) => {
      return cache.addAll(
        CORE.map((value) => new Request(value, {'cache': 'reload'})));
    })
  );
});
// During activate, the cache is populated with the temp files downloaded in
// install. If this service worker is upgrading from one with a saved
// MANIFEST, then use this to retain unchanged resource files.
self.addEventListener("activate", function(event) {
  return event.waitUntil(async function() {
    try {
      var contentCache = await caches.open(CACHE_NAME);
      var tempCache = await caches.open(TEMP);
      var manifestCache = await caches.open(MANIFEST);
      var manifest = await manifestCache.match('manifest');
      // When there is no prior manifest, clear the entire cache.
      if (!manifest) {
        await caches.delete(CACHE_NAME);
        contentCache = await caches.open(CACHE_NAME);
        for (var request of await tempCache.keys()) {
          var response = await tempCache.match(request);
          await contentCache.put(request, response);
        }
        await caches.delete(TEMP);
        // Save the manifest to make future upgrades efficient.
        await manifestCache.put('manifest', new Response(JSON.stringify(RESOURCES)));
        // Claim client to enable caching on first launch
        self.clients.claim();
        return;
      }
      var oldManifest = await manifest.json();
      var origin = self.location.origin;
      for (var request of await contentCache.keys()) {
        var key = request.url.substring(origin.length + 1);
        if (key == "") {
          key = "/";
        }
        // If a resource from the old manifest is not in the new cache, or if
        // the MD5 sum has changed, delete it. Otherwise the resource is left
        // in the cache and can be reused by the new service worker.
        if (!RESOURCES[key] || RESOURCES[key] != oldManifest[key]) {
          await contentCache.delete(request);
        }
      }
      // Populate the cache with the app shell TEMP files, potentially overwriting
      // cache files preserved above.
      for (var request of await tempCache.keys()) {
        var response = await tempCache.match(request);
        await contentCache.put(request, response);
      }
      await caches.delete(TEMP);
      // Save the manifest to make future upgrades efficient.
      await manifestCache.put('manifest', new Response(JSON.stringify(RESOURCES)));
      // Claim client to enable caching on first launch
      self.clients.claim();
      return;
    } catch (err) {
      // On an unhandled exception the state of the cache cannot be guaranteed.
      console.error('Failed to upgrade service worker: ' + err);
      await caches.delete(CACHE_NAME);
      await caches.delete(TEMP);
      await caches.delete(MANIFEST);
    }
  }());
});
// The fetch handler redirects requests for RESOURCE files to the service
// worker cache.
self.addEventListener("fetch", (event) => {
  if (event.request.method !== 'GET') {
    return;
  }
  var origin = self.location.origin;
  var key = event.request.url.substring(origin.length + 1);
  // Redirect URLs to the index.html
  if (key.indexOf('?v=') != -1) {
    key = key.split('?v=')[0];
  }
  if (event.request.url == origin || event.request.url.startsWith(origin + '/#') || key == '') {
    key = '/';
  }
  // If the URL is not the RESOURCE list then return to signal that the
  // browser should take over.
  if (!RESOURCES[key]) {
    return;
  }
  // If the URL is the index.html, perform an online-first request.
  if (key == '/') {
    return onlineFirst(event);
  }
  event.respondWith(caches.open(CACHE_NAME)
    .then((cache) =>  {
      return cache.match(event.request).then((response) => {
        // Either respond with the cached resource, or perform a fetch and
        // lazily populate the cache only if the resource was successfully fetched.
        return response || fetch(event.request).then((response) => {
          if (response && Boolean(response.ok)) {
            cache.put(event.request, response.clone());
          }
          return response;
        });
      })
    })
  );
});
self.addEventListener('message', (event) => {
  // SkipWaiting can be used to immediately activate a waiting service worker.
  // This will also require a page refresh triggered by the main worker.
  if (event.data === 'skipWaiting') {
    self.skipWaiting();
    return;
  }
  if (event.data === 'downloadOffline') {
    downloadOffline();
    return;
  }
});
// Download offline will check the RESOURCES for all files not in the cache
// and populate them.
async function downloadOffline() {
  var resources = [];
  var contentCache = await caches.open(CACHE_NAME);
  var currentContent = {};
  for (var request of await contentCache.keys()) {
    var key = request.url.substring(origin.length + 1);
    if (key == "") {
      key = "/";
    }
    currentContent[key] = true;
  }
  for (var resourceKey of Object.keys(RESOURCES)) {
    if (!currentContent[resourceKey]) {
      resources.push(resourceKey);
    }
  }
  return contentCache.addAll(resources);
}
// Attempt to download the resource online before falling back to
// the offline cache.
function onlineFirst(event) {
  return event.respondWith(
    fetch(event.request).then((response) => {
      return caches.open(CACHE_NAME).then((cache) => {
        cache.put(event.request, response.clone());
        return response;
      });
    }).catch((error) => {
      return caches.open(CACHE_NAME).then((cache) => {
        return cache.match(event.request).then((response) => {
          if (response != null) {
            return response;
          }
          throw error;
        });
      });
    })
  );
}
