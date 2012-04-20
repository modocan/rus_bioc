package {
import contexts.MainContext;

import flash.display.MovieClip;
import flash.display.StageAlign;
import flash.display.StageScaleMode;

import org.robotlegs.core.IContext;

[SWF(frameRate="24", height="600", width="1000", backgroundColor="#333333")]

public class Flex_Contador extends MovieClip {

    private var contexto:IContext;

    public function Flex_Contador() {

        this.stage.align = StageAlign.TOP_LEFT;
        this.stage.scaleMode = StageScaleMode.NO_SCALE;

        contexto = new MainContext(this);

    }
}
}
