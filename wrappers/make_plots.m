%% Plot trajectory 2D
figure;
hold on;
grid on;
axis equal;
xlabel("x [m]");
ylabel("y [m]");

p = nsidedpoly(1000, 'Center', [5,0], 'Radius', 1);
plot(p);

X = out.logsout.getElement("X");
x_pose = squeeze(X.Values.Position.Data);

X_ref = out.logsout.getElement("X_ref");
x_ref_pose = squeeze(X_ref.Values.Data);

plot(x_pose(1,:), x_pose(2,:), "LineWidth", 2, "DisplayName", "Trajectory");
plot(x_ref_pose(:, 1), x_ref_pose(:, 3), ":", "LineWidth", 2, "DisplayName", "Trajectory Reference");

%% Plot trajectory signals
figure;

X = out.logsout.getElement("X");
x_pose = squeeze(X.Values.Position.Data);
x_pose_time = X.Values.Position.Time;
yaw_value = squeeze(X.Values.Yaw.Data);
yaw_value_time = X.Values.Yaw.Time;

subplot(3, 1, 1);
hold on;
grid on;
xlabel("Time [s]");
ylabel("x [m]");
plot(x_pose_time, x_pose(1, :), "LineWidth", 2, "DisplayName", "x");
plot(x_ref_pose_time, x_ref_pose(:,1), ":", "LineWidth", 2, "DisplayName", "x_{ref}");

subplot(3, 1, 2);
hold on;
grid on;
xlabel("Time [s]");
ylabel("y [m]");
plot(x_pose_time, x_pose(2, :), "LineWidth", 2, "DisplayName", "y");
plot(x_ref_pose_time, x_ref_pose(:, 3), ":", "LineWidth", 2, "DisplayName", "y_{ref}");

subplot(3, 1, 3);
hold on;
grid on;
xlabel("Time [s]");
ylabel("\theta [rad]");
plot(x_pose_time, x_pose(3, :), "LineWidth", 2, "DisplayName", "\theta");
plot(yaw_value_time, yaw_value, ":", "LineWidth", 2, "DisplayName", "\theta_{ref}");

%% Plot CBF
figure;
hold on;
grid on;
axis equal;
xlabel("Time [s]");

h = out.logsout.getElement("h");
hp = out.logsout.getElement("hp");
is_overwritten = out.logsout.getElement("is_overwritten");

plot(h.Values.Time, h.Values.Data, "LineWidth", 2, "DisplayName", "h(x,u)");
plot(hp.Values.Time, hp.Values.Data, "LineWidth", 2, "DisplayName", "h'(x,u)");
plot(is_overwritten.Values.Time, is_overwritten.Values.Data, "LineWidth", 2, ...
    "DisplayName", "Is Overwritten");

%% Plot control
figure;

u = out.logsout.getElement("u");
u_value = squeeze(u.Values.Data);
u_time = u.Values.Time;

subplot(2, 1, 1);
hold on;
grid on;
xlabel("Time [s]");
ylabel("u_{v} [m/s]");
plot(u_time, u_value(1, :), "LineWidth", 2, "DisplayName", "u_{v}");
plot(is_overwritten.Values.Time, is_overwritten.Values.Data, ":", "LineWidth", 2, ...
    "DisplayName", "Is Overwritten");

subplot(2, 1, 2);
hold on;
grid on;
xlabel("Time [s]");
ylabel("u_{\omega} [m/s]");
plot(u_time, u_value(2, :), "LineWidth", 2, "DisplayName", "u_{\omega}");
plot(is_overwritten.Values.Time, is_overwritten.Values.Data, ":", "LineWidth", 2, ...
    "DisplayName", "Is Overwritten");