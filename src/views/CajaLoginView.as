/**
 * Created with IntelliJ IDEA.
 * User: barbaradominguez
 * Date: 21/04/12
 * Time: 15:43
 * To change this template use File | Settings | File Templates.
 */
package views {
import com.greensock.TweenLite;
import com.hexagonstar.util.debug.Debug;

import events.PreguntasEvent;

import flash.display.Sprite;
import flash.events.Event;
import flash.events.MouseEvent;

public class CajaLoginView extends Sprite {

    private var titulo:TituloSeccionPreguntas;
    public var login:CajaLogin;
    private var _this:CajaLoginView;
    private var caja_texto:CajaTextoView;

    public function CajaLoginView() {
        _this = this;
        this.addEventListener(Event.ADDED_TO_STAGE, init);
    }

    private function init(e:Event):void
    {
        this.removeEventListener(Event.ADDED_TO_STAGE, init);

        titulo = new TituloSeccionPreguntas();
        titulo.name = 'titulo';
        titulo.addEventListener(Event.ADDED_TO_STAGE, pintaLogin);
        addChild(titulo);
    }


    private function pintaLogin(e:Event):void
    {

        var evento:PreguntasEvent;
        titulo.removeEventListener(Event.ADDED_TO_STAGE, pintaLogin);

        login = new CajaLogin();
        login.x = (titulo.width/2) - (login.width/2);
        login.y = titulo.height + 15;
        login.fb.buttonMode = login.twt.buttonMode = true;
        login.fb.addEventListener(MouseEvent.CLICK, function(e:MouseEvent){
            evento = new PreguntasEvent(PreguntasEvent.LOGIN);
            evento.datos.tipo = 'fb';
            _this.dispatchEvent(evento);
        });
        login.twt.addEventListener(MouseEvent.CLICK, function(e:MouseEvent){
            evento = new PreguntasEvent(PreguntasEvent.LOGIN);
            evento.datos.tipo = 'twt';
            _this.dispatchEvent(evento);
        });
        addChild(login);
    }


    public function ocultaLogin(datos:Object):void
    {
        TweenLite.to(login,  0.4, {alpha: 0, onComplete:function(){
            login.visible = false;

        }});
    }


    public function pintaCaja(datos:Object):void
    {
        caja_texto = new CajaTextoView(datos);
        caja_texto.y = titulo.y + titulo.height + 15;
        caja_texto.addEventListener(Event.ADDED_TO_STAGE, function(e:Event){
            caja_texto.x = (titulo.x + (titulo.width/2)) - (caja_texto.width/2);
        })  ;
        addChild(caja_texto);
    }


}
}
