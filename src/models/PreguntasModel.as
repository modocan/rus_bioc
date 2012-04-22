/**
 * Created with IntelliJ IDEA.
 * User: barbaradominguez
 * Date: 22/04/12
 * Time: 14:13
 * To change this template use File | Settings | File Templates.
 */
package models {
import com.hexagonstar.util.debug.Debug;

import flash.net.NetConnection;
import flash.net.Responder;

import org.robotlegs.mvcs.Actor;

public class PreguntasModel extends Actor implements IPreguntasModel {

    private const GATEWAY:String = 'http://www.tourflex.es/amfphp/gateway.php';
    private var cn:NetConnection;

    public function PreguntasModel() {
        super();
    }


    public function enviaPregunta(usuario:Object, pregunta:String):void
    {
        var envio:Object = new Object();

        if(usuario.tipo == 'fb'){
            envio.nombre = usuario.first_name;
            envio.apellidos = usuario.last_name;
            envio.pregunta = pregunta;
            envio.id_social = usuario.id;
            envio.red_social = 0;
            envio.aprobado = 0;
            envio.seleccionado = 0;
        }

        cn = new NetConnection();
        cn.connect(GATEWAY);
        cn.call('ContactService.registraPregunta', new Responder(respuestaPregunta), envio);
    }

    private function respuestaPregunta(datos:Object):void
    {
        Debug.trace(datos, Debug.LEVEL_ERROR);
    }


}
}
