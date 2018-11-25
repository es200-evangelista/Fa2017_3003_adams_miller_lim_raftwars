classdef KeyboardEmulator < handle
   
    properties
        jlx = 0; %joystick position
        jly = 0;
        btnstate = zeros(1,15);
        btnmap = cell(15,1)
    end
    
    methods
        function this = KeyboardEmulator(h)
            h.KeyPressFcn = @(src,event)keyPressed(this,src,event);
            h.KeyReleaseFcn = @(src,event)keyReleased(this,src,event);
            for i = 1:15
                this.btnmap{i} = 'empty';
            end
        this.btnmap{1} = 'space';    
        end
       
        function keyPressed(this,~,event)
            switch event.Key
                case 'leftarrow'
                    this.jlx = -0.5;
                case 'rightarrow'
                    this.jlx = 0.5;
                case 'uparrow'
                    this.jly = 0.5;
                case 'downarrow'
                    this.jly = -0.5;
            end
            for i=1:15
                if strcmp(event.Key,this.btnmap{i})==1
                    this.btnstate(i)=1;
                end
            end
        end
        function keyReleased(this,~,event)
            switch event.Key
                case 'leftarrow'
                    this.jlx = 0;
                case 'rightarrow'
                    this.jlx = 0;
                case 'uparrow'
                    this.jly = 0;
                case 'downarrow'
                    this.jly = 0;
            end
            for i=1:15
                if strcmp(event.Key,this.btnmap{i})==1
                    this.btnstate(i)=0;
                end
            end
        end
        function mapButton(this,key,button)
            this.btnmap{button}=key;
        end
        function [result] = isPressed(this,key)
            result = this.btnstate(key);
        end
        function update(~)
            %nop, for compatibility with PS3 controller
        end
    end
    
end

