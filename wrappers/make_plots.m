%% Plot trajectory 2D
figure;
hold on;
grid on;
xlabel("x [m]");
ylabel("y [m]");
legend("show");

p = nsidedpoly(1000, 'Center', [5,0], 'Radius', 1);
plot(p, "DisplayName", "Obstacle");

p = nsidedpoly(1000, 'Center', [20,0.5], 'Radius', 1);
plot(p, "DisplayName", "Obstacle");

p = nsidedpoly(1000, 'Center', [30,-1], 'Radius', 1);
plot(p, "DisplayName", "Obstacle");

p = nsidedpoly(1000, 'Center', [29,2], 'Radius', 1);
plot(p, "DisplayName", "Obstacle");

X = out.logsout.getElement("X");
x_pose = squeeze(X.Values.Position.Data);

X_ref = out.logsout.getElement("X_ref");
x_ref_pose = squeeze(X_ref.Values.Data);

plot(x_pose(1,:), x_pose(2,:), "LineWidth", 2, "DisplayName", "Trajectory");
plot(x_ref_pose(:, 1), x_ref_pose(:, 3), ":", "LineWidth", 2, "DisplayName", "Trajectory Reference");

is_overwritten = out.logsout.getElement("is_overwritten").Values.Data;
plot(x_pose(1,is_overwritten), x_pose(2,is_overwritten), ".", "LineWidth", 1, "DisplayName", "Modified Trajectory");

%% Plot trajectory signals
figure;

X = out.logsout.getElement("X");
x_pose = squeeze(X.Values.Position.Data);
x_pose_time = X.Values.Position.Time;
yaw_value = squeeze(X.Values.Yaw.Data);
yaw_value_time = X.Values.Yaw.Time;

X_ref = out.logsout.getElement("X_ref");
x_ref_pose = squeeze(X_ref.Values.Data);
x_ref_pose_time = X_ref.Values.Time;

subplot(3, 1, 1);
hold on;
grid on;
xlabel("Time [s]");
ylabel("x [m]");
legend("show");
plot(x_pose_time, x_pose(1, :), "LineWidth", 2, "DisplayName", "x");
plot(x_ref_pose_time, x_ref_pose(:,1), ":", "LineWidth", 2, "DisplayName", "x_{ref}");

subplot(3, 1, 2);
hold on;
grid on;
xlabel("Time [s]");
ylabel("y [m]");
legend("show");
plot(x_pose_time, x_pose(2, :), "LineWidth", 2, "DisplayName", "y");
plot(x_ref_pose_time, x_ref_pose(:, 3), ":", "LineWidth", 2, "DisplayName", "y_{ref}");

subplot(3, 1, 3);
hold on;
grid on;
xlabel("Time [s]");
ylabel("\theta [rad]");
legend("show");
plot(x_pose_time, x_pose(3, :), "LineWidth", 2, "DisplayName", "\theta");
plot(yaw_value_time, yaw_value, ":", "LineWidth", 2, "DisplayName", "\theta_{ref}");

%% Plot CBF
figure;
hold on;
grid on;
xlabel("Time [s]");
legend("show");

h = out.logsout.getElement("h");
hp = out.logsout.getElement("hp");
is_overwritten = out.logsout.getElement("is_overwritten");

plot(h.Values.Time, squeeze(h.Values.Data), "LineWidth", 2, "DisplayName", "h(x,u)");
plot(hp.Values.Time, squeeze(hp.Values.Data), "LineWidth", 2, "DisplayName", "h'(x,u)");
plot(is_overwritten.Values.Time, is_overwritten.Values.Data, "LineWidth", 2, ...
    "DisplayName", "Is Overwritten");

%% Plot control
figure;

u = out.logsout.getElement("u");
u_value = squeeze(u.Values.Data);
u_time = u.Values.Time;

u_n = out.logsout.getElement("u_n");
u_n_value = squeeze(u_n.Values.Data);
u_n_time = u_n.Values.Time;

subplot(2, 1, 1);
hold on;
grid on;
xlabel("Time [s]");
ylabel("u_{v} [m/s]");
legend("show");
plot(u_time, u_value(1, :), "LineWidth", 2, "DisplayName", "u_{v}");
plot(u_n_time, u_n_value(1, :), "--", "LineWidth", 2, "DisplayName", "u_{n,v}");
plot(is_overwritten.Values.Time, is_overwritten.Values.Data, ":", "LineWidth", 2, ...
    "DisplayName", "Is Overwritten");

subplot(2, 1, 2);
hold on;
grid on;
xlabel("Time [s]");
ylabel("u_{\omega} [m/s]");
legend("show");
plot(u_time, u_value(2, :), "LineWidth", 2, "DisplayName", "u_{\omega}");
plot(u_n_time, u_n_value(2, :), "--", "LineWidth", 2, "DisplayName", "u_{\omega}");
plot(is_overwritten.Values.Time, is_overwritten.Values.Data, ":", "LineWidth", 2, ...
    "DisplayName", "Is Overwritten");