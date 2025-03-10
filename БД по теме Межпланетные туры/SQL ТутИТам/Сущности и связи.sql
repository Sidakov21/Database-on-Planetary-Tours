CREATE TABLE Planets (
    PlanetID INT PRIMARY KEY IDENTITY(1,1), -- ���������� ������������� �������
    Name NVARCHAR(100) NOT NULL,			-- �������� �������
    Coordinates NVARCHAR(100),				-- ���������� ������� � ���������
    Type NVARCHAR(50),						-- ��� ������� (��������, ����������, ������� ������ � �. �.)
    Features NVARCHAR(255)					-- ����������� ������� (������� ���������, ����������� � �. �.)
);

CREATE TABLE Transport (
    TransportID INT PRIMARY KEY IDENTITY(1,1), -- ���������� ������������� ����������
    Model NVARCHAR(100),						-- ������ �������
    Capacity INT,								-- ����������� ������� (����� ����������)
    Speed DECIMAL(18, 2),						-- �������� �������
    SpecialConditions NVARCHAR(255)				-- ������ ������� (��������, "����� � ������������� �����������")
);

CREATE TABLE Tours (
    TourID INT PRIMARY KEY IDENTITY(1,1), -- ���������� ������������� ����
    Route NVARCHAR(255),					-- ������ ������, ����� ������� �������� ������� (��������, ����������� �������)
    Duration INT,							-- ����������������� ���� (� ����)
    Price DECIMAL(18, 2),					-- ��������� ����
    Difficulty NVARCHAR(50),				-- ��������� ���� ("��� ��������", "��� �������")  
);

CREATE TABLE Tourists (
    TouristID INT PRIMARY KEY IDENTITY(1,1), -- ���������� ������������� �������
    Name NVARCHAR(100) NOT NULL,			-- ��� �������
    Age INT,								-- ������� �������
    TrainingLevel NVARCHAR(50),				-- ������� ���������� (��������, "����������", "�������")
    Preferences NVARCHAR(255)				-- ������������ ������� (��������, "������������� �������", "�������")
);




CREATE TABLE Tour_Planets (
    TourID INT,										-- ������������� ����
    PlanetID INT,									-- ������������� �������

    FOREIGN KEY (TourID) REFERENCES Tours(TourID), -- ������� ���� �� ������� "����"
    FOREIGN KEY (PlanetID) REFERENCES Planets(PlanetID), -- ������� ���� �� ������� "�������"
    PRIMARY KEY (TourID, PlanetID)					-- ����������� ���� ��� ����� ����� � ������
);

CREATE TABLE Tourist_Tours (
    TouristID INT,									-- ������������� �������
    TourID INT,										-- ������������� ����

    FOREIGN KEY (TouristID) REFERENCES Tourists(TouristID), -- ������� ���� �� ������� "�������"
    FOREIGN KEY (TourID) REFERENCES Tours(TourID),			-- ������� ���� �� ������� "����"
    PRIMARY KEY (TouristID, TourID)							-- ����������� ���� ��� ����� �������� � �����
);

CREATE TABLE Tour_Transport (
    TourID INT,										-- ������������� ����
    TransportID INT,								-- ������������� ����������

    FOREIGN KEY (TourID) REFERENCES Tours(TourID), -- ������� ���� �� ������� "����"
    FOREIGN KEY (TransportID) REFERENCES Transport(TransportID), -- ������� ���� �� ������� "���������"
    PRIMARY KEY (TourID, TransportID)			-- ����������� ���� ��� ����� ����� � ����������
);


