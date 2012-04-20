/**
 * Created with IntelliJ IDEA.
 * User: barbaradominguez
 * Date: 19/04/12
 * Time: 22:25
 * To change this template use File | Settings | File Templates.
 */
package views {
import flash.display.Sprite;
import flash.events.Event;

public class MainView extends Sprite {

    private var marco:Marco;
    private var bisel:BiselMenu;

    public function MainView() {
        this.addEventListener(Event.ADDED_TO_STAGE, init);
    }


    private function init(e:Event):void
    {
        this.stage.addEventListener(Event.RESIZE, ajusta);

        marco = new Marco();
        marco.name = 'marco';
        marco.width = this.stage.stageWidth - 40;
        marco.height = this.stage.stageHeight - 100;
        marco.x = 20;
        marco.y = this.stage.stageHeight - (marco.height + 40);
        addChild(marco);

        bisel = new BiselMenu();
        bisel.name = 'bisel';
        bisel.x = marco.x - 5;
        bisel.y = marco.y - (bisel.height/2);
        bisel.width = marco.width + 10;
        addChild(bisel);
    }



    private function ajusta(e:Event):void
    {
         if(this.getChildByName('marco')){
             marco.width = this.stage.stageWidth - 40;
             marco.height = this.stage.stageHeight - 100;
             marco.x = 20;
             marco.y = this.stage.stageHeight - (marco.height + 40);
         }

         if(this.getChildByName('bisel'))
         {
             bisel.x = marco.x - 10;
             bisel.y = marco.y - (bisel.height/2);
             bisel.width = marco.width + 20;
         }
    }

}
}
