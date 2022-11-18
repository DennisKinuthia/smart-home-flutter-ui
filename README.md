# Smart House App Flutter UI

#### This UI screen is from [Mitch Koko](https://www.youtube.com/@MitchKoko)

## Learning points

1. The GridView builder widget for the 4 smart devices cards
~~~
Expanded(
            child: GridView.builder(
              padding: const EdgeInsets.all(15.0),
              physics: const NeverScrollableScrollPhysics(), //prevent the grid view from scrolling up or down
              itemCount: smartDevices.length,
              //restrict the number of children widgets that can fit horizonatlly
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount( 
                // make the children widgets inside the gridview appear rectangular. Their default shape is square
                  childAspectRatio: 1 / 1.3, crossAxisCount: 2),
              itemBuilder: (context, index) {
                return SmartDeviceBox(
                  deviceName: smartDevices[index][0],
                  iconPath: smartDevices[index][1],
                  powerOn: smartDevices[index][2],
                  onChange: (value) => _powerSwitchChanged(value, index),
                );
              },
            ),
          ),
~~~

2. The Cupertino (IOS) switch and its onChange function.
~~~
//the function that changes the state of the switch triggering the build function to rebuild the widget tree.
void _powerSwitchChanged(bool status, int index) {
    setState(() {
      smartDevices[index][2] = status;
    });

//the gridview itemBuilder function that returns a smart device custom widget which h
itemBuilder: (context, index) {
                return SmartDeviceBox(
                  deviceName: smartDevices[index][0],
                  iconPath: smartDevices[index][1],
                  powerOn: smartDevices[index][2],
                  onChange: (value) => _powerSwitchChanged(value, index),
                );
              },
~~~

3. Wrap a widget with the Transform.rotate() widget to transform it through a rotational transformation.
~~~
//rotate the cupertino switch at an angle of 1/2 pi. The rotation occures from the center of the widget and uses clockwise radians
Transform.rotate(
                  angle: pi / 2,
                  child: CupertinoSwitch(
                    value: powerOn,
                    onChanged: onChange,
                  ),
                )
~~~

4. Change the color themes on powerOn or powerOff
~~~
color: powerOn ? Colors.black : Colors.white,
~~~

ScreenShot

![Simulator Screen Shot - iPhone 13 - 2022-11-18 at 13 27 15](https://user-images.githubusercontent.com/98651593/202668231-7380ae31-c770-4735-bd2f-8670f84e22e8.png)
![Simulator Screen Shot - iPhone 13 - 2022-11-18 at 13 27 19](https://user-images.githubusercontent.com/98651593/202668225-89b8d973-268e-48e6-b99a-fd913d66b73a.png)
![Simulator Screen Shot - iPhone 13 - 2022-11-18 at 13 27 11](https://user-images.githubusercontent.com/98651593/202668236-de72c12a-0ce4-48fa-8419-8a33bf0504b8.png)


