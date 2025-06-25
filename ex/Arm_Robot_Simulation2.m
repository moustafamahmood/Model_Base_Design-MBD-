classdef Arm_Robot_Simulation2 < matlab.apps.AppBase

    % Properties that correspond to app components
    properties (Access = public)
        UIFigure          matlab.ui.Figure
        SIMULATIONButton  matlab.ui.control.Button
        L1EditField       matlab.ui.control.NumericEditField
        L1EditFieldLabel  matlab.ui.control.Label
        L2EditField       matlab.ui.control.NumericEditField
        L2EditFieldLabel  matlab.ui.control.Label
        UIAxes            matlab.ui.control.UIAxes
    end

    % Callbacks that handle component events
    methods (Access = private)

        % Button down function: UIAxes
        function UIAxesButtonDown(app, event)
hold(app.UIAxes,'off');
l1= app.L1EditField.value;
l2= app.L2EditField.Value;
theta1=linspace(0,90,1000);
theta2=linspace(0,180,1000);

x1 = l1*cosd(theta1);
y1= l1*sind(theta1);
x2= x1+l2*cosd(theta2);
y2= y1+l2*sind(theta2);

p1 = plot(app,uiaxes,[0,x1(1)],[0,y1(1)]);
hold(app.UIAxes,'on');
p2= plot(app.UIAxes,[x1(1),x2(1)],[y1(1),y2(1)]);
hold on;
xlim (app.UIAxes,[-l1*2,l1*2]);
ylim (app.UIAxes,[-l1*2,l1*2]);
plot(app.UIAxes,x2,y2);
for i=1:10:length(theta1)
  delete p1;
  delete p2;
  p1 = plot(app.UIAxes,[0,x1(i)],[0,y1(i)],'r');
  p2= plot(app.UIAxes,[x1(i),x2(i)],[y1(i),y2(i)],'b');
drawnow
end


        end
    end

    % Component initialization
    methods (Access = private)

        % Create UIFigure and components
        function createComponents(app)

            % Create UIFigure and hide until all components are created
            app.UIFigure = uifigure('Visible', 'off');
            app.UIFigure.Position = [100 100 640 480];
            app.UIFigure.Name = 'MATLAB App';

            % Create UIAxes
            app.UIAxes = uiaxes(app.UIFigure);
            title(app.UIAxes, 'Arm-Robot-Simulation')
            xlabel(app.UIAxes, 'X')
            ylabel(app.UIAxes, 'Y')
            zlabel(app.UIAxes, 'Z')
            app.UIAxes.ButtonDownFcn = createCallbackFcn(app, @UIAxesButtonDown, true);
            app.UIAxes.Position = [49 106 543 346];

            % Create L2EditFieldLabel
            app.L2EditFieldLabel = uilabel(app.UIFigure);
            app.L2EditFieldLabel.HorizontalAlignment = 'right';
            app.L2EditFieldLabel.Position = [452 29 25 22];
            app.L2EditFieldLabel.Text = 'L2';

            % Create L2EditField
            app.L2EditField = uieditfield(app.UIFigure, 'numeric');
            app.L2EditField.Limits = [0 30];
            app.L2EditField.Position = [492 29 100 22];
            app.L2EditField.Value = 7;

            % Create L1EditFieldLabel
            app.L1EditFieldLabel = uilabel(app.UIFigure);
            app.L1EditFieldLabel.HorizontalAlignment = 'right';
            app.L1EditFieldLabel.Position = [266 29 25 22];
            app.L1EditFieldLabel.Text = 'L1';

            % Create L1EditField
            app.L1EditField = uieditfield(app.UIFigure, 'numeric');
            app.L1EditField.Limits = [0 30];
            app.L1EditField.Position = [306 29 100 22];
            app.L1EditField.Value = 10;

            % Create SIMULATIONButton
            app.SIMULATIONButton = uibutton(app.UIFigure, 'push');
            app.SIMULATIONButton.Position = [147 29 100 23];
            app.SIMULATIONButton.Text = 'SIMULATION';

            % Show the figure after all components are created
            app.UIFigure.Visible = 'on';
        end
    end

    % App creation and deletion
    methods (Access = public)

        % Construct app
        function app = Arm_Robot_Simulation

            % Create UIFigure and components
            createComponents(app)

            % Register the app with App Designer
            registerApp(app, app.UIFigure)

            if nargout == 0
                clear app
            end
        end

        % Code that executes before app deletion
        function delete(app)

            % Delete UIFigure when app is deleted
            delete(app.UIFigure)
        end
    end
end