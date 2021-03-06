/***************************************************************************
  qgsdiagramproperties.h
  Properties for diagram layers
  -------------------
         begin                : August 2012
         copyright            : (C) Matthias Kuhn
         email                : matthias at opengis dot ch

 ***************************************************************************
 *                                                                         *
 *   This program is free software; you can redistribute it and/or modify  *
 *   it under the terms of the GNU General Public License as published by  *
 *   the Free Software Foundation; either version 2 of the License, or     *
 *   (at your option) any later version.                                   *
 *                                                                         *
 ***************************************************************************/

#ifndef QGSDIAGRAMPROPERTIES_H
#define QGSDIAGRAMPROPERTIES_H

#include <QDialog>
#include "qgsdiagramrenderer.h"
#include "ui_qgsdiagrampropertiesbase.h"
#include <QStyledItemDelegate>
#include "qgis_app.h"

class QgsVectorLayer;
class QgsMapCanvas;

class APP_EXPORT QgsDiagramProperties : public QWidget, private Ui::QgsDiagramPropertiesBase, private QgsExpressionContextGenerator
{
    Q_OBJECT

  public:
    QgsDiagramProperties( QgsVectorLayer *layer, QWidget *parent, QgsMapCanvas *canvas );

    ~QgsDiagramProperties();

    //! Adds an attribute from the list of available attributes to the assigned attributes with a random color.
    void addAttribute( QTreeWidgetItem *item );

  public slots:
    void apply();
    void on_mDiagramTypeComboBox_currentIndexChanged( int index );
    void on_mAddCategoryPushButton_clicked();
    void on_mAttributesTreeWidget_itemDoubleClicked( QTreeWidgetItem *item, int column );
    void on_mFindMaximumValueButton_clicked();
    void on_mRemoveCategoryPushButton_clicked();
    void on_mDiagramAttributesTreeWidget_itemDoubleClicked( QTreeWidgetItem *item, int column );
    void on_mEngineSettingsButton_clicked();
    void showAddAttributeExpressionDialog();
    void on_mDiagramStackedWidget_currentChanged( int index );
    void on_mPlacementComboBox_currentIndexChanged( int index );
    void scalingTypeChanged();
    void showSizeLegendDialog();

  protected:

    QgsVectorLayer *mLayer = nullptr;

  private:

    enum Columns
    {
      ColumnAttributeExpression = 0,
      ColumnColor,
      ColumnLegendText,
    };

    enum Roles
    {
      RoleAttributeExpression = Qt::UserRole,
    };

    QString showExpressionBuilder( const QString &initialExpression );

    QgsPropertyCollection mDataDefinedProperties;

    // Keeps track of the diagram type to properly save / restore settings when the diagram type combo box is set to no diagram.
    QString mDiagramType;
    std::unique_ptr< QgsDataDefinedSizeLegend > mSizeLegend;

    QString guessLegendText( const QString &expression );
    QgsMapCanvas *mMapCanvas = nullptr;

    QgsExpressionContext createExpressionContext() const override;

    void registerDataDefinedButton( QgsPropertyOverrideButton *button, QgsDiagramLayerSettings::Property key );

  private slots:

    void updateProperty();
};

class EditBlockerDelegate: public QStyledItemDelegate
{
  public:
    EditBlockerDelegate( QObject *parent = nullptr )
      : QStyledItemDelegate( parent )
    {}

    virtual QWidget *createEditor( QWidget *, const QStyleOptionViewItem &, const QModelIndex & ) const override
    {
      return nullptr;
    }
};


#endif // QGSDIAGRAMPROPERTIES_H
