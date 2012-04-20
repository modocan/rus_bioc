/**
 * Created with IntelliJ IDEA.
 * User: barbaradominguez
 * Date: 19/04/12
 * Time: 23:57
 * To change this template use File | Settings | File Templates.
 */
package models {

import org.robotlegs.mvcs.Actor;

public class MainModel extends Actor implements IMainModel {

    private var seccionesFase1:Array = ['INICIO', 'TOUR FLEX', 'PREGUNTA A CONTADOR'];

    public function MainModel() {
        super();
    }


    public function dameSecciones():Array
    {
        return seccionesFase1;
    }
}
}
