USE MASTER 
--TAO CSDL
CREATE DATABASE QUANLYBAIDOXE
GO 
USE QUANLYBAIDOXE
--XOA CSDL
DROP DATABASE QUANLYBAIDOXE

CREATE TABLE vehicles (
    id INT PRIMARY KEY IDENTITY(1,1),             -- Tự động tăng
    license_plate VARCHAR(20) NOT NULL UNIQUE,    -- Biển số xe
    status VARCHAR(10) NOT NULL                     -- 'in' hoặc 'out'
);
DROP TABLE vehicles

CREATE TABLE parking_logs (
    id INT PRIMARY KEY IDENTITY(1,1),              -- Tự động tăng
    vehicle_id INT NOT NULL,                        -- Khóa ngoại tham chiếu tới bảng vehicles
    entry_time DATETIME NOT NULL,                   -- Thời gian xe vào bãi
    exit_time DATETIME,                             -- Thời gian xe ra khỏi bãi
    FOREIGN KEY (vehicle_id) REFERENCES vehicles(id) -- Khóa ngoại từ bảng vehicles
);

CREATE TABLE parking_spots (
    id INT PRIMARY KEY IDENTITY(1,1),              -- Tự động tăng
    spot_number VARCHAR(10) NOT NULL UNIQUE,       -- Số hiệu của chỗ đỗ
    is_occupied BIT DEFAULT 0,                      -- Trạng thái: Đầy (1) hoặc trống (0)
    light_status BIT DEFAULT 0,                     -- Trạng thái đèn: Sáng (1) hoặc tắt (0)
    last_update DATETIME DEFAULT GETDATE()          -- Thời gian cập nhật
);

INSERT INTO vehicles (license_plate, status)
VALUES ('ABC123', 'in');  -- Thay 'ABC123' bằng biển số xe thực tế

INSERT INTO parking_logs (vehicle_id, entry_time)
VALUES (SCOPE_IDENTITY(), GETDATE());  -- Giả định vehicle_id vừa được tạo

-- Cập nhật trạng thái của xe
UPDATE vehicles
SET status = 'out'
WHERE license_plate = 'ABC123' AND status = 'in';  -- Thay 'ABC123' bằng biển số xe thực tế

-- Cập nhật thời gian ra trong bảng parking_logs
UPDATE parking_logs
SET exit_time = GETDATE()
WHERE vehicle_id = (SELECT id FROM vehicles WHERE license_plate = 'ABC123') AND exit_time IS NULL;


-- lấy danh sách xe đang trong bãi
SELECT * FROM vehicles WHERE status = 'in';

-- lấy lịch sử ra vào của xe theo một biển số
SELECT pl.entry_time, pl.exit_time
FROM parking_logs pl
JOIN vehicles v ON pl.vehicle_id = v.id
WHERE v.license_plate = 'ABC123';  -- Thay 'ABC123' bằng biển số xe thực tế




