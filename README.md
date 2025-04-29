to build the application use [prebuild_script.sh](prebuild_script.sh)

for mac users use [fast_prebuild_script_mac.sh](fast_prebuild_script_mac.sh)

to run the script execute /bin/bash /Users/user/Flutter/Project/imgur/[script].sh command from the applications' root
directory

the application was made using [dev_pilot cli](https://pub.dev/packages/dev_pilot)

the app' architecture is separated into three modules according to Clean Architecture approach:

- data - communication layer
- domain - business layer logic
- presentation - UI components

in the same time presentation layers is also separated to the multiple modules and it's possible to maintain them
separately

features/images contains an example of blocTest
root/tests contains an example of unit tests

API clientSecret is stored as const just for time saving. For the production and security need to move the key inside .env
file 








