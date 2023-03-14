/***************************************************************************
* Copyleft (CC BY-SA 4.0) 2023 Justan O'Strawman  <justanotherstrawman@gmail.com>
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
import QtQuick 2.15
import QtQuick.Layouts 1.12
Rectangle{
    id:root
    implicitWidth:899
    implicitHeight: 800
    anchors.fill:parent
    color:"#00808080"
    property real allBright:1
    property real allDim:0.5
    property color allBkgnd:"#ff000070"
    property color allText:"#ff707070"

    ColumnLayout{
 clip:true
 anchors.fill:parent
 spacing: 20
 TextGlowButton{
 Layout.fillWidth: true;Layout.fillHeight: true;label: "Power Off";textCol:allText;buttonCol:allBkgnd; highOpacity:allBright; lowOpacity:allDim;show:sddm.canPowerOff;onAction: {sddm.powerOff()}
 }
 TextGlowButton{
 Layout.fillWidth: true; Layout.fillHeight: true; label: "Reboot"; textCol:allText; buttonCol:allBkgnd; highOpacity:allBright; lowOpacity:allDim; show:sddm.canReboot;onAction: {sddm.reboot()}
 }
 TextGlowButton{
 Layout.fillWidth: true; Layout.fillHeight: true; label: "Suspend"; textCol:allText; buttonCol:allBkgnd; highOpacity:allBright; lowOpacity:allDim; show:sddm.canSuspend; onAction: {sddm.suspend()}
 }
 TextGlowButton{
 Layout.fillWidth: true; Layout.fillHeight: true; label: "Hibernate"; textCol:allText; buttonCol:allBkgnd; highOpacity:allBright; lowOpacity:allDim; show:sddm.canHibernate; onAction: {sddm.hibernate()}
 }
 TextGlowButton{
 Layout.fillWidth: true; Layout.fillHeight: true; label: "Hybrid Sleep"; textCol:allText; buttonCol:allBkgnd; highOpacity:allBright; lowOpacity:allDim; show:sddm.canHybridSleep; onAction: {sddm.hybridSleep()}
 }
 }



        }


