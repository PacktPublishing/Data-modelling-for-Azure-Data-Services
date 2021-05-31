CREATE TABLE dbo.dimDate
(
	DateKey					int				NOT NULL
	, Date					date			NOT NULL
	, DayNumber				int				NOT NULL
	, Day					nvarchar(15)	NOT NULL
	, Week					int				NOT NULL
	, ISO_Week				int				NOT NULL
	, DayOfWeek				int				NOT NULL
	, CalendarMonthNumber	int				NOT NULL
	, MonthKey				int				NOT NULL
	, FiscalMonthNumber		int				NOT NULL
	, Month					nvarchar(15)	NOT NULL
	, MonthOfYear			nvarchar(25)	NOT NULL
	, CalendarQuarter		nvarchar(25)	NOT NULL
	, FiscalQuarter			nvarchar(25)	NOT NULL
	, CalendarYear			nvarchar(7)		NOT NULL
	, FiscalYear			nvarchar(7)		NOT NULL
	, FirstDayOfMonth		date			NOT NULL
	, LastDayOfYear			date			NOT NULL
	, DayOfYear				int				NOT NULL
)
WITH
(
	DISTRIBUTION = REPLICATE
	, CLUSTERED INDEX (DateKey ASC)
);


