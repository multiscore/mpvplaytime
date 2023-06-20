import QtQuick 2.0
import MuseScore 3.0
MuseScore {
    menuPath: "Plugins.mpvplaytime"
    Component.onCompleted: {
        if (mscoreMajorVersion >= 4) {
            title = qsTr("mpv playtime")
            //thumbnailName = "some_thumbnail.png"
            //categoryCode = "some_category"
        }
    }
    description : qsTr("This plugin adds MPV player's `--input-ipc-server` socket playtime mark as text in your score.")
    version : "1.0"
    QProcess { id: proc }
    onRun: {
        console.warn('os: '+Qt.platform.os)
        var com
        switch (Qt.platform.os){
            case "windows":
                com = 'pwsh /c ' + Qt.resolvedUrl(".").replace("file:///", "") + 'mp.ipc.ps1'
                break;
            case "osx":
                com = '/bin/sh ' + Qt.resolvedUrl(".").replace("file://", "") + 'mpvsocketmac.sh'
                break;
            default:
                com = '/bin/sh ' + Qt.resolvedUrl(".").replace("file://", "") + 'mpvsocketunix.sh'
        }
        console.warn("Command call: "+com)
        proc.start(com)
        var val=proc.waitForFinished(5000)
        var out
        // DEBUG
        try {
            out=proc.readAllStandardOutput()
            console.warn("-- Command output: "+out)
            if (val) {
                console.warn('terminated correctly.')
            } else {
                console.warn('failure')
            }
        } catch (err) {
            console.warn("--" + err.message);
        }
        var c=curScore.newCursor()
        c.inputStateMode=Cursor.INPUT_STATE_SYNC_WITH_SCORE
        var t = newElement(Element.STAFF_TEXT); 
        t.fontSize= 20
        t.text = out
        curScore.startCmd()
        c.add(t)
        curScore.endCmd()
        if (mscoreMajorVersion < 4) {
            Qt.quit()
        }
    }
}