SOURCE="https://download1.operacdn.com/pub/opera/desktop/64.0.3417.92/linux/opera-stable_64.0.3417.92_amd64.deb"
DESTINATION="build.deb"
OUTPUT="Opera.AppImage"


all:
	echo "Building: $(OUTPUT)"
	wget -O $(DESTINATION) -c $(SOURCE)
	
	dpkg -x $(DESTINATION) build
	rm -rf AppDir/opt
	
	mkdir --parents AppDir/opt/application
	mv build/usr/lib/x86_64-linux-gnu/opera/* AppDir/opt/application

	chmod +x AppDir/AppRun

	appimagetool AppDir $(OUTPUT)

	chmod +x $(OUTPUT)

	rm -f $(DESTINATION)
	rm -rf AppDir/opt
	rm -rf build
