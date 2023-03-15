EXEC tSQLt.NewTestClass 'testTodoApp';
GO

CREATE PROCEDURE testTodoApp.[test that the insert todo will default to public for owner_id]
AS
BEGIN
    DECLARE @errorThrown bit; SET @errorThrown = 0;
    
    EXEC tSQLt.FakeTable 'dbo.todos', @Identity = 1, @Defaults = 1;

    BEGIN TRY
        INSERT INTO dbo.todos (title, completed)
                       VALUES ('Test', 0);

    END TRY
    BEGIN CATCH
        SET @errorThrown = 1;
    END CATCH;    

    IF (@errorThrown = 1 OR (EXISTS (SELECT 1 FROM dbo.todos where owner_id != 'public')))
    BEGIN
        EXEC tSQLt.Fail 'Todos table should not allow null for owner_id and default to public';
    END;

    IF EXISTS (SELECT 1 FROM dbo.todos where owner_id != 'public')
        EXEC tSQLt.Fail 'Todos table should not allow null for owner_id and default to public';
END;
GO