/**
 * Created with IntelliJ IDEA.
 * User: barbaradominguez
 * Date: 21/04/12
 * Time: 12:04
 * To change this template use File | Settings | File Templates.
 */
package events {
import flash.events.Event;

public class PreguntasEvent extends Event {

    public static const LOGIN:String = 'PreguntasEvent.LOGIN';

    private var _datos:Object = new Object();

    public function PreguntasEvent(tipo:String) {
        super(tipo);
    }

    public function get datos():Object {
        return _datos;
    }

    public function set datos(value:Object):void {
        _datos = value;
    }
}
}
