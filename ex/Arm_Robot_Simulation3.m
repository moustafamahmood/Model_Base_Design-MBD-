classdef Arm_Robot_Simulation3 < matlab.apps.AppBase

    properties (Access = public)
        UIFigure          matlab.ui.Figure
        SIMULATIONButton  matlab.ui.control.Button
        L1EditField       matlab.ui.control.NumericEditField
        L1EditFieldLabel  matlab.ui.control.Label
        L2EditField       matlab.ui.control.NumericEditField
        L2EditFieldLabel  matlab.ui.control.Label
        UIAxes            matlab.ui.control.UIAxes
        Theta1Value       double = 0; % Initial value for theta1
        Theta2Value       double = 90; % Initial value for theta2
        Timer             timer; % Timer for automatic updates
    end

    methods (Access = private)

        function startTimer(app)
            app.Timer = timer('ExecutionMode', 'fixedRate', 'Period', 0.1, ...
                'TimerFcn', @(~,~) updateAngles(app));
            start(app.Timer);
        end

        function updateAngles(app)
            % Update angles
            app.Theta1Value = mod(app.Theta1Value + 1, 90); % Increment theta1
            app.Theta2Value = mod(app.Theta2Value + 1, 90) + 90; % Increment theta2

            % Call the simulate function to update the plot
            simulateArm(app);
        end

        function simulateArm(app)
            l1 = app.L1EditField.Value;
            l2 = app.L2EditField.Value;
            theta1 = app.Theta1Value;
            theta2 = app.Theta2Value;

            x1 = l1 * cosd(theta1);
            y1 = l1 * sind(theta1);
            x2 = x1 + l2 * cosd(theta1 + theta2);
            y2 = y1 + l2 * sind(theta1 + theta2);

            % Plot the arm
            plot(app.UIAxes, [0, x1, x2], [0, y1, y2], 'LineWidth', 2);
            xlim(app.UIAxes, [-l1*2, l1*2]);
            ylim(app.UIAxes, [-l1*2, l1*2]);
            title(app.UIAxes, 'Arm Simulation');
            xlabel(app.UIAxes, 'X');
            ylabel(app.UIAxes, 'Y');
            grid(app.UIAxes, 'on');
        end

        function stopTimer(app)
            if isvalid(app.Timer)
                stop(app.Timer);
                delete(app.Timer);
            end
        end
    end

    methods (Access = private)

        function createComponents(app)
            app.UIFigure = uifigure('Visible', 'off');
            app.UIFigure.Position = [100 100 640 480];
            app.UIFigure.Name = 'MATLAB Arm Simulation';

            app.UIAxes = uiaxes(app.UIFigure);
            app.UIAxes.Position = [50 100 540 350];

            app.L1EditFieldLabel = uilabel(app.UIFigure);
            app.L1EditFieldLabel.Text = 'L1 (Length 1)';
            app.L1EditFieldLabel.Position = [50 50 75 22];

            app.L1EditField = uieditfield(app.UIFigure, 'numeric');
            app.L1EditField.Position = [130 50 100 22];
            app.L1EditField.Value = 10;

            app.L2EditFieldLabel = uilabel(app.UIFigure);
            app.L2EditFieldLabel.Text = 'L2 (Length 2)';
            app.L2EditFieldLabel.Position = [250 50 75 22];

            app.L2EditField = uieditfield(app.UIFigure, 'numeric');
            app.L2EditField.Position = [330 50 100 22];
            app.L2EditField.Value = 10;

            app.SIMULATIONButton = uibutton(app.UIFigure, 'push');
            app.SIMULATIONButton.Position = [250 10 100 23];
            app.SIMULATIONButton.Text = 'START SIMULATION';
            app.SIMULATIONButton.ButtonPushedFcn = @(src, event) startTimer(app);

            app.UIFigure.Visible = 'on';
        end
    end

    methods (Access = public)

        function app = Arm_Robot_Simulation3
            createComponents(app);
            registerApp(app, app.UIFigure);
            if nargout == 0
                clear app;
            end
        end

        function delete(app)
            stopTimer(app); % Stop the timer if the app is deleted
            delete(app.UIFigure);
        end
    end
end