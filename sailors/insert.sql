use sailors; 

insert into
    sailors (sid, sname, rating, age)
values
    (1, "Albert", 5.0, 40),
    (2, "Nakul", 5.0, 49),
    (3, "Darshan", 9, 18),
    (4, "Astorm Gowds", 2, 68),
    (5, "Armstormin", 7, 19);

insert into
    boat (bid, bname, color)
values
    (1, "Boat_1", "Green"),
    (2, "Boat_2", "Red"),
    (103, "Boat_3", "Blue"),
    (104, "Boat_4", "Pink");

insert into
    reserves (sid, bid, day)
values
    (1, 103, "2023-01-01"),
    (1, 2, "2023-02-01"),
    (2, 1, "2023-02-05"),
    (3, 2, "2023-03-06"),
    (5, 103, "2023-03-06"),
    (1, 1, "2023-03-06"),
    (1, 104, "2023-12-12");