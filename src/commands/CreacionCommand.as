/**
 * Created with IntelliJ IDEA.
 * User: barbaradominguez
 * Date: 19/04/12
 * Time: 22:21
 * To change this template use File | Settings | File Templates.
 */
package commands
{

import models.IMainModel;

import org.robotlegs.mvcs.Command;

import views.MainView;

public class CreacionCommand extends Command {
    
    [Inject]
    public var modelo:IMainModel;


    public function CreacionCommand() {
        super();
    }

    override public function execute():void
    {
        contextView.addChild(new MainView(modelo.dameEnlaceWeb(), modelo.dameEnlaceBioceramics()));
    }

}
}
