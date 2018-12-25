create or replace package body user_auth is
    
     PROCEDURE new_user (
        user_code    OUT          Number,
        status       OUT          VARCHAR2,
        user_name    IN           user_.user_name%TYPE,
        user_phone   IN           user_.user_phone%TYPE
    ) IS
    BEGIN
        BEGIN
            INSERT INTO user_ (
            user_phone,
            user_name,
            user_code              
            ) VALUES (
            user_phone,
            user_name,
            (select round(dbms_random.value(1000, 9999)) code from dual)) 
            RETURNING user_.user_code INTO user_code;
            COMMIT;
            user_code := user_code;
            status := 'ok';
        EXCEPTION
            WHEN dup_val_on_index THEN
                status := 'user already exists';
            WHEN OTHERS THEN
                status := sqlerrm;
        END;
    END new_user;


    PROCEDURE update_user_code (
        ucode    OUT          Number,
        st       OUT          VARCHAR2,
        uphone   IN           user_.user_phone%TYPE
    ) IS
    BEGIN
        BEGIN
            UPDATE user_ SET user_.user_code = (select round(dbms_random.value(1000, 9999)) code from dual) WHERE user_.user_phone = uphone
            RETURNING user_.user_code INTO ucode;
            COMMIT;
            ucode := ucode;
            st := 'ok';
        END;
    END update_user_code;

end user_auth;
