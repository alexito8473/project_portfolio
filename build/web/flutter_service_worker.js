'use strict';
const MANIFEST = 'flutter-app-manifest';
const TEMP = 'flutter-temp-cache';
const CACHE_NAME = 'flutter-app-cache';

const RESOURCES = {"404.html": "0a27a4163254fc8fce870c8cc3a3f94f",
"Alejandro_Aguilar.pdf": "3d0e5cb42ef7b745ee235bd84e89380d",
"assets/AssetManifest.bin": "dad8a45a0112a2fd6918a0f3efd9cf46",
"assets/AssetManifest.bin.json": "a0e6da45eb2e36d4d40188beff752fa8",
"assets/AssetManifest.json": "3aa5881e7cc1a0971893c3563e9233c2",
"assets/assets/images/BackgroundBoat.webp": "2b0b3e365d2598911c3286dd3d79c9cb",
"assets/assets/images/certificates/certificate_bloc.webp": "213518fc58f3ee190937dddaf4d60e53",
"assets/assets/images/certificates/certificate_java.webp": "92b2036ad8a690169eb04ae73ba4e3a9",
"assets/assets/images/certificates/certificate_react_ai.webp": "eddb7203eb5339007be64050931865ca",
"assets/assets/images/certificates/certificate_spring_ai.webp": "3815bec77bb1256e14c8613e32010268",
"assets/assets/images/NoWork.webp": "413b753521babfb4ed8337c5ba58bb3a",
"assets/assets/images/personal.avif": "9b768de13fe9ed29755e2b413de83500",
"assets/assets/images/personal.webp": "bcf10205696d1ba1a36b5d0793b225c5",
"assets/assets/images/projects/appStudent/1.webp": "6f3f94574c3fbb043b3210e744a65280",
"assets/assets/images/projects/appStudent/1_full.webp": "d9e0cc3b8e83793b9809d8586de25a9d",
"assets/assets/images/projects/appTeacher/1.webp": "b773a2b4e7d4ce1c944d3fdc41fdfbd8",
"assets/assets/images/projects/appTeacher/1_full.webp": "0dad741f00f33834bdadaa0e2452e2ad",
"assets/assets/images/projects/gomoku/1.webp": "2cee61abd942f253a6e657d20e459d43",
"assets/assets/images/projects/gomoku/1_full.webp": "fe270b53afac66b5180b978c7bc46bb4",
"assets/assets/images/projects/goReversi/1.webp": "d348c1824defd37d3d581edfca67ddca",
"assets/assets/images/projects/goReversi/1_full.webp": "b0ea4f45bcb7415febc2a669c0019cd8",
"assets/assets/images/projects/imcCalculator/1.webp": "afbf31db9d65b85d096242a4388159e0",
"assets/assets/images/projects/imcCalculator/1_full.webp": "e40f9672c52f9c6ec9cb12aa23abdcf5",
"assets/assets/images/projects/paintVanilla/1.webp": "c4ae3e7cc10028cb472d52f0a3403296",
"assets/assets/images/projects/paintVanilla/1_full.webp": "457c525c7f1d4a16d1ae122d4eb512a2",
"assets/assets/images/projects/pokeApi/1.webp": "fab8fa483f8da813505d1498a7af3bc0",
"assets/assets/images/projects/pokeApi/1_full.webp": "dd23f6c4840a5f8641e24b0531b3e5c5",
"assets/assets/images/projects/tasty/1.webp": "181bb228dadfbf9ab5b23f97da6ef1f2",
"assets/assets/images/projects/tasty/1_full.webp": "9595e77e627b6c71aba1c2c6b2e36a26",
"assets/assets/images/projects/ticTacToe/1.webp": "dc4dd5fe37b3b2ebd6acf982109e5829",
"assets/assets/images/projects/ticTacToe/1_full.webp": "de41489986acd71c08cf144114511ef1",
"assets/assets/images/projects/ultraRestaurant/1.webp": "7054870e00a4429950668b775c98b538",
"assets/assets/images/projects/ultraRestaurant/1_Full.webp": "90de0929f1f330e8c5fc8d4284a5c744",
"assets/assets/pdf/Alejandro_Aguilar.pdf": "0282edea204d17aaa12ddc164ca1032c",
"assets/assets/svg/certificate.svg": "5d64f41e587e1793dc03224c9697a4e6",
"assets/assets/svg/eclipse.svg": "468d03d6934af4cea7a4175ba3d6c94a",
"assets/assets/svg/git.svg": "5eed2c8cb62e1adfae09b0129a25a1a7",
"assets/assets/svg/github.svg": "91fc7cd187b65073322024169d2cd416",
"assets/assets/svg/intellij.svg": "12dd7832374a7b7f9406c6ed7388e908",
"assets/assets/svg/languageCode.svg": "e47c7b88f48bb2099d51e23f40ec8f82",
"assets/assets/svg/linkedin.svg": "2c20928ddc18c3e2ac70e6f8f38ca825",
"assets/assets/svg/programLanguage/android.svg": "591117075fc95dd71b6a3563a08766fd",
"assets/assets/svg/programLanguage/css.svg": "97e0b59800bc30b5c18a7b12dfbbaf6d",
"assets/assets/svg/programLanguage/dart.svg": "77736b70355db3b992d712891749acd5",
"assets/assets/svg/programLanguage/firebase.svg": "4e81eead83acdcbe873a2297c4ca83aa",
"assets/assets/svg/programLanguage/flutter.svg": "9a6e81be6ff5b09956f4f85fe1f0a89f",
"assets/assets/svg/programLanguage/html.svg": "10328348fe4795e4153dd39118804af4",
"assets/assets/svg/programLanguage/java.svg": "45f6ff15dcfe17b99a87bcbd6f9d7582",
"assets/assets/svg/programLanguage/javascript.svg": "ca60a139a15167ae52f9d9b65cb718ad",
"assets/assets/svg/programLanguage/kotlin.svg": "54972a0c9408fceebecbf6a0b0229d11",
"assets/assets/svg/programLanguage/maui.svg": "37258a983459ae1c2e4f1e551665f388",
"assets/assets/svg/programLanguage/mongoDb.svg": "50c2dcb538382c9ae419739112624d9e",
"assets/assets/svg/programLanguage/mysql.svg": "088fa127aac415780022cd8ef7970383",
"assets/assets/svg/programLanguage/php.svg": "e26767d241095e15f840c5b5d376a649",
"assets/assets/svg/programLanguage/python.svg": "26f5129d3abd6d3232bcd2d8cd80a012",
"assets/assets/svg/programLanguage/react.svg": "f0340143227cc3546b667fd9c4d1e1d8",
"assets/assets/svg/programLanguage/spring.svg": "1c963b52830704f69efe489b3b1167a6",
"assets/assets/svg/project.svg": "af443ef75dc06fa5a0d7760cf931829d",
"assets/assets/svg/visualStudio.svg": "ec257ddd94fa88701961ccd3bfda37db",
"assets/assets/svg/visualStudioCode.svg": "a0f33ad8ad533f1dd3a77bf2f100edae",
"assets/assets/svg/web.svg": "4af5a71f843c1ee0394219b923dee09b",
"assets/FontManifest.json": "dc3d03800ccca4601324923c0b1d6d57",
"assets/fonts/MaterialIcons-Regular.otf": "748020b8b48f800026a496c667f224af",
"assets/NOTICES": "419ad25a9dbaec7b81af1495124efc63",
"assets/packages/cupertino_icons/assets/CupertinoIcons.ttf": "e85f81421cba2b29f95d75066c7c09a6",
"assets/packages/mobkit_dashed_border/images/type1.png": "9f8e612a54622229bd4b97e5357a473c",
"assets/packages/mobkit_dashed_border/images/type2.png": "17a23dec244c3d1bb5b4ae67d7bd48b3",
"assets/packages/mobkit_dashed_border/images/type3.png": "2d50ab9d78a15b2f20012c3b9ea56c46",
"assets/packages/mobkit_dashed_border/images/type4.png": "9250b4ccf17768b5c7d6afcaebadf3f9",
"assets/shaders/ink_sparkle.frag": "ecc85a2e95f5e9f53123dcaf8cb9b6ce",
"canvaskit/canvaskit.js": "66177750aff65a66cb07bb44b8c6422b",
"canvaskit/canvaskit.js.symbols": "48c83a2ce573d9692e8d970e288d75f7",
"canvaskit/canvaskit.wasm": "1f237a213d7370cf95f443d896176460",
"canvaskit/chromium/canvaskit.js": "671c6b4f8fcc199dcc551c7bb125f239",
"canvaskit/chromium/canvaskit.js.symbols": "a012ed99ccba193cf96bb2643003f6fc",
"canvaskit/chromium/canvaskit.wasm": "b1ac05b29c127d86df4bcfbf50dd902a",
"canvaskit/skwasm.js": "694fda5704053957c2594de355805228",
"canvaskit/skwasm.js.symbols": "262f4827a1317abb59d71d6c587a93e2",
"canvaskit/skwasm.wasm": "9f0c0c02b82a910d12ce0543ec130e60",
"canvaskit/skwasm.worker.js": "89990e8c92bcb123999aa81f7e203b1c",
"favicon.png": "5dcef449791fa27946b3d35ad8803796",
"flutter.js": "f393d3c16b631f36852323de8e583132",
"flutter_bootstrap.js": "b22dbad3e22c782f2349f73c754fdd18",
"icons/Icon-192.png": "ac9a721a12bbc803b44f645561ecb1e1",
"icons/Icon-512.png": "96e752610906ba2a93c65f8abe1645f1",
"icons/Icon-maskable-192.png": "c457ef57daa1d16f64b27b786ec2ea3c",
"icons/Icon-maskable-512.png": "301a7604d45b3e739efc881eb04896ea",
"icons/languageCode.svg": "e47c7b88f48bb2099d51e23f40ec8f82",
"index.html": "19a580a2f89d273e3cab73c582565d02",
"/": "19a580a2f89d273e3cab73c582565d02",
"main.dart.js": "41f4f1b3a8f796fb4c4ab4f7ee717e85",
"main.dart.js_1.part.js": "cf39f008d1932802ee01719b54a08e43",
"main.dart.js_10.part.js": "5e5fa647c8fdc8469d21dd9d1c727b55",
"main.dart.js_11.part.js": "65219365d5a60982106b87fe11d6763d",
"main.dart.js_12.part.js": "d87dabc1704724c5deb6dc8b456a3968",
"main.dart.js_13.part.js": "3c9dc57d1a9a613af7af2d42601bad96",
"main.dart.js_14.part.js": "2b2833425dc8ec3865df95e653ede088",
"main.dart.js_15.part.js": "b7a7aee5bfb759069d7ae80f847d3160",
"main.dart.js_16.part.js": "22ca76eb4ee0005fdbb59d3a7cb35f0a",
"main.dart.js_17.part.js": "bd641885e039c64890237c28407485da",
"main.dart.js_18.part.js": "8d5279270442e058e197397f616f8364",
"main.dart.js_19.part.js": "53b766b2df990ae96424d2eb592e738b",
"main.dart.js_2.part.js": "66a3816a68bdeb04370b5a8f8bc5ac75",
"main.dart.js_20.part.js": "a038ca5387d2451d0609c46a4b598cfc",
"main.dart.js_21.part.js": "733146bcb549d2007b43564f88e10795",
"main.dart.js_22.part.js": "dd35522bce14aad5c51560ac3231fc88",
"main.dart.js_23.part.js": "0ad765a35467487f9d66f73a22941c0e",
"main.dart.js_24.part.js": "3494f533468c9222e755a355d85f85b6",
"main.dart.js_26.part.js": "43d6e493b4e08393c797c227a2055224",
"main.dart.js_27.part.js": "bd64bf650ba43cbb3086a2db99d6211b",
"main.dart.js_28.part.js": "928f5bfdf60821037671794a8c4f81b4",
"main.dart.js_3.part.js": "184fb02a6f2dbf352c0428fd1b3038d1",
"main.dart.js_31.part.js": "4a4e65f51b9b1abd7a35fd15f9dc5f69",
"main.dart.js_32.part.js": "f152268fa905a31593c61ce3594dc398",
"main.dart.js_33.part.js": "f0dd40d251e9327c4994e85816420396",
"main.dart.js_35.part.js": "213ea5861d2f6484caab6ad3135f048d",
"main.dart.js_36.part.js": "6e1642fca7894f31239d7685bc599fa7",
"main.dart.js_37.part.js": "a58f0ebfbc0d0b12ce6e655d14689c93",
"main.dart.js_38.part.js": "88f346ef0154099ee43f38c6aa5871d0",
"main.dart.js_39.part.js": "11b7bee381c7a272507a73b899428ffe",
"main.dart.js_4.part.js": "10414cdd3dc5f7dbe51e56daecbb8a05",
"main.dart.js_44.part.js": "2027265d2fd88f6ff1967a828c6678aa",
"main.dart.js_45.part.js": "86bceb5ed54fe6a8e356ec482085c40e",
"main.dart.js_46.part.js": "4297b212854edd8c2287eb7915b8476d",
"main.dart.js_47.part.js": "1c48bc5e418db877b72890ad1d944a41",
"main.dart.js_48.part.js": "b5262d7113dc86766a13fa51aae4dc5d",
"main.dart.js_49.part.js": "8d8b0ab723afc845f3070bd8519689d6",
"main.dart.js_5.part.js": "7a2c6d1e093dd78ffd3e4742f328fcb9",
"main.dart.js_51.part.js": "e2305b1ec353d1dea85791f6b4c4fdc4",
"main.dart.js_52.part.js": "d43fb11eac0c3c892857da5967b818b0",
"main.dart.js_54.part.js": "241c066bf5c19050c7023bcfb08d2632",
"main.dart.js_55.part.js": "f436680351120d64fc795b956264769f",
"main.dart.js_56.part.js": "4343dca91395f82ae8defad93d6c0b41",
"main.dart.js_57.part.js": "97d5151dc5290fba8548749e01d85040",
"main.dart.js_58.part.js": "31e44eac27186e345cc1eafec1746cc0",
"main.dart.js_59.part.js": "1d0c672548a04f79b329a102fc36ae3d",
"main.dart.js_6.part.js": "a22b0936b0f16781c36255db09a4193d",
"main.dart.js_60.part.js": "9cc4f1ade553576eaec2c9e8b594bfe0",
"main.dart.js_61.part.js": "8bde706ed39981dc83b740deb69a202e",
"main.dart.js_62.part.js": "a95ddebee1edcf649627b6e7a12a2fa5",
"main.dart.js_63.part.js": "3af5b8ddf2d54bc5bfb10c45537327fa",
"main.dart.js_64.part.js": "76f6361b39f6621d63f47ff633ff0788",
"main.dart.js_65.part.js": "41233b3e65271505d9346ebc90c2bbc4",
"main.dart.js_66.part.js": "1248f5b7d01a08ed2f8f105c4b3a0e45",
"main.dart.js_67.part.js": "7a86d5eb3546946f1764ea30072d564b",
"main.dart.js_68.part.js": "3b5e4337dffb93795815f5e2fd3859e3",
"main.dart.js_69.part.js": "0bd4b72799b1d0bdbfbb93b23113d847",
"main.dart.js_7.part.js": "da7e5087ba3396691fa49948d7bd8593",
"main.dart.js_70.part.js": "eec834caa166cf116d6e3cd38f64fe79",
"main.dart.js_72.part.js": "84a218802080cbbb526aec34609fcaee",
"main.dart.js_8.part.js": "e8ec7129d10bc2219058b9498b859790",
"main.dart.js_9.part.js": "c91046a8fab29c76b061b4b967c2fe19",
"main.dart.mjs": "8d6eaba9917720e7e6c356a2dca2afc3",
"main.dart.wasm": "f66a6b98523019e76f04c783a9988386",
"manifest.json": "f471a7c0d026d4db558873a2525269b2",
"version.json": "875a719c6a564058c9e63c6f2853302f"};
// The application shell files that are downloaded before a service worker can
// start.
const CORE = ["main.dart.js",
"main.dart.wasm",
"main.dart.mjs",
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
