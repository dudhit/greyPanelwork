import QtQuick 2.15
import QtQuick.Controls 2.15
import Qt.labs.settings 1.0
import QtQuick.Window 2.15

/***************************************************************************
* Copyleft (CC BY-SA 4.0) 2023 Justan O'Strawman <justanotherstrawman@gmail.com>
* Permission is hereby granted, free of charge, to any person
* obtaining a copy of this software and associated documentation
* files (the "Software"), to deal in the Software without restriction,
* including without limitation the rights to use, copy, modify, merge,
* publish, distribute, sublicense, and/or sell copies of the Software,
* and to permit persons to whom the Software is furnished to do so,
* subject to the following conditions:
*
* The above copyright notice and this permission notice shall be included
* in all copies or substantial portions of the Software.
*
* THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS
* OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
* FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL
* THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR
* OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE,
* ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE
* OR OTHER DEALINGS IN THE SOFTWARE.
*
***************************************************************************/

Window{
    id:sddm
    height:760
    width:1080
    onActiveFocusItemChanged:console.log("activeFocusItem",activeFocusItem, activeFocusItem.focus)
    property bool canPowerOff:true
    property bool canReboot:true
    property bool canSuspend:true
    property bool canHibernate:true
    property bool canHybridSleep:true
    property string hostName:qsTr("my pc")//sddm DOES NOT PROVIDE

    property color backGroundColour:config.backGroundColour
    property color backGroundTranspColour:config.backGroundTranspColour
    property color firstGradient:config.firstGradient
    property color secondGradient:config.secondGradient
    property color finalGradient:config.finalGradient
    property color textColour:config.textColour


   property color   dateTextColour:config.dateTextColour
   property color   dateTextShadow:config.dateTextShadow
   property string  preferredFont:config.preferredFont
   property int  dateSize:config.dateSize
   property int  panelHeaderSize:config.panelHeaderSize
   property int  generalTextSize:config.generalTextSize
   property real  buttonMaxOpacity:config.buttonMaxOpacity
   property real  buttonMinOpacity:config.buttonMinOpacity
   property int  buttonAffectSpeed:config.buttonAffectSpeed


    property int windowWidth:sddm.width
    property int windowHeight:sddm.height
    ListModel {
        id:sessionModel
        ListElement { file:"lxqt";name:"lxqt desktop";exec:"execlxqt";comment:"qt based desktop";lastIndex:0}
        ListElement { file:"openbox";name:"open box";exec:"execobox";comment:"meh";lastIndex:1}
        ListElement { file:"lxdx";name:"lxdx";exec:"execobox";comment:"meh2";lastIndex:2}
        ListElement { file:"gdm";name:"gdm";exec:"execobox";comment:"meh3";lastIndex:3}
        ListElement { file:"kde";name:"kde";exec:"execobox";comment:"meh4";lastIndex:4}
    }
    ListModel {
        id:userModel
        ListElement {name:"media";realName:"multi media";homeDir:"";icon:".face.icon";lastIndex:1;lastUser:1 }
        ListElement {name:"dud";realName:"dudhit";homeDir:"/home/dud";icon:".face.icon";lastIndex:1;lastUser:1 }
        ListElement {name:"fman";realName:"frederic";homeDir:"/home/fman";icon:".face.icon";lastIndex:1;lastUser:1 }
        ListElement {name:"hijinx";realName:"marjory";homeDir:"/home/hijinx";icon:".face.icon";lastIndex:1;lastUser:1 }
        ListElement {name:"lolcatz";realName:"elenor";homeDir:"/home/lolcatz";icon:".face.icon";lastIndex:1;lastUser:1 }


    }
    ListModel {
        id:screenModel
        ListElement { name:"screen";geometry:1;primary:0}
    }
    QtObject{
        id:config
        property color backGroundColour:"#ff000000"
        property color backGroundTranspColour:"#000000ff"
        property color firstGradient:"#ff404040"
        property color secondGradient:"#ffc0c0c0"
        property color finalGradient:"#ffeeeeee"
        property color textColour:"#eeeeeeee"
        property string preferredFont:"Tahoma"
        property color dateTextColour:"#ff000000"
        property color dateTextShadow:"#ff808080"
        property int dateSize:44
        property int panelHeaderSize:24
        property int generalTextSize:20
        property real buttonMaxOpacity:0.5
        property real buttonMinOpacity:0.1
        property int  buttonAffectSpeed:5000

    }

    function powerOff(){console.log("powerOff function executed")}
    function suspend(){console.log("suspend function executed")}
    function reboot(){console.log("reboot function executed")}
    function hibernate(){console.log("hibernate function executed")}
    function hybridSleep(){console.log("hybridSleep function executed")}
    signal loginSucceeded()
    signal loginFailed()
    function login( name, pw, index){
        if (name==="dud"&& pw ==="tesT" && index >=0 ) loginSucceeded(); else  loginFailed();
    }//console.log("you did it!")}

    Main{ height:sddm.height;width:sddm.width }
    // PowerView{}
    //    Selector{        model:userModel;   modelView:UserView{};   flow:ListView.Horizontal    }
}
