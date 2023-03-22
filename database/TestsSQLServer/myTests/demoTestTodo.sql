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


CREATE PROCEDURE testTodoApp.[test that todo table has change tracking enabled]
AS
BEGIN
    DECLARE @errorThrown bit; SET @errorThrown = 0;

    IF NOT EXISTS(SELECT * FROM sys.objects O
        INNER JOIN sys.change_tracking_tables CT ON O.object_id = CT.object_id
        WHERE O.[name] = 'todos' AND O.[type] = 'U')
    BEGIN
        EXEC tSQLt.Fail 'Todos table should have change tracking enabled'
    END

END;
GO